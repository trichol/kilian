const functions = require("firebase-functions");
const admin = require("firebase-admin");
const path = require("path");
const os = require("os");
const fs = require("fs");
const htmlPdf = require("html-pdf-node");
// To avoid deployment errors, do not call admin.initializeApp() in your code

function formatDateTime(input) {
  // Parse the input string into a Date object
  const date = new Date(input);

  // Check if the Date object is valid
  if (isNaN(date.getTime())) {
    throw new Error("Invalid datetime format");
  }

  // Extract components of the date
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0"); // Months are 0-based
  const year = date.getFullYear();
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");

  // Construct the formatted string
  return `le ${day}/${month}/${year} à ${hours}:${minutes}`;
}

exports.cloudBuildContratVente = functions
  .region("europe-west1")
  .runWith({
    memory: "512MB",
  })
  .https.onCall(async (data, context) => {
    // Write your code below!
    let posCode = "0";
    try {
      // Validate input
      if (!data.contratData) {
        return { message: "Invalid contratData" };
      }
      // Access nested fields
      const modeleHtmlContrat = data.contratData.modeleHtmlContrat;
      const contratPDF = data.contratData.contratPDF;
      //const title = data.contratData.title;
      //const status = data.contratData.status;
      const auteur = data.contratData.auteur;
      const location = data.contratData.location;
      const horaire = formatDateTime(data.contratData.horaire_rendezVous);
      let date_creation = data.contratData.date_creation.substring(0, 19);
      const contractants = data.contratData.contractantsData || [];
      const objetsContrat = data.contratData.objetsContrat || [];

      const timestamp = Date.now().toString();
      const bucket = admin.storage().bucket();
      const tempHtmlPath = path.join(
        os.tmpdir(),
        "tmp_contrat_" + timestamp + ".html",
      );
      const tempPdfPath = path.join(
        os.tmpdir(),
        "tmp_contrat_" + timestamp + ".pdf",
      );

      const listeNomPrenomContractants = contractants
        .map(
          (contractant) => `${contractant.type} :<br>
                    <b>Nom : </b>${contractant.genre} ${contractant.nom} ${contractant.prenom}<br>
                    <b>Adresse : </b>${contractant.adresse}<br>
                    <b>Nom : </b>${contractant.genre} ${contractant.nom} ${contractant.prenom}<br>
                    <b>Téléphone : </b>${contractant.phone_number}<br>
                    <b>Courriel : </b>${contractant.email}<br>                    
                    `,
        )
        .join("<br><br> ");

      const descriptionObjetContrat = `<p class='section-title'>1. Objet de la vente</p>
        <p>
            Le vendeur s'engage à vendre à l'acheteur le bien suivant :${objetContrat.titre}<br>
            - Description : ${objetContrat.description}<br>
        </p>

        <p class='section-title'>2. Prix de vente</p>
        <p>
            Le prix convenu pour le bien est de : <strong>${objetContrat.prix} €</strong>.<br>
        </p>

        <p class='section-title'>3. État du bien</p>
        <p>
            L'acheteur reconnaît avoir examiné le bien et accepte de l'acquérir dans son état actuel :<br>
            - Vendu 'en l'état' : ${objetContrat.enletat}<br>
            - Le vendeur garantit le bon fonctionnement du bien : ${objetContrat.estFonctionnel}
        </p>`;

      // Formatting horaire properly

      // Download the HTML template from Firebase Storage
      const file = bucket.file(modeleHtmlContrat);

      // Check if the file exists
      const [exists] = await file.exists();
      if (!exists) {
        console.error(modeleHtmlContrat + " manquant!");
        return { message: `Fichier manquant :  ${modeleHtmlContrat}` };
      }

      // File exists, proceed to download
      await file.download({ destination: tempHtmlPath });

      // Store html content in htmlContent
      let htmlContent = "";
      if (fs.existsSync(tempHtmlPath)) {
        htmlContent = fs.readFileSync(tempHtmlPath, "utf8");
      } else {
        console.error("File does not exist after download.");
        return {
          message:
            "File does not exist after download." +
            tempHtmlPath +
            "" +
            modeleHtmlContrat,
        };
      }

      // Check htmlContent consistency
      if (htmlContent.length <= 2) {
        console.error("contenu modele html vide!");
        return { message: "contenu modele html vide!" };
      }

      // Replace placeholders in htmlContent
      try {
        htmlContent = htmlContent
          .replace(/\[AA\]/g, listeNomPrenomContractants)
          .replace(/\[BB\]/g, descriptionObjetContrat)
          .replace(/\[HH\]/g, horaire)
          .replace(/\[AUTEUR\]/g, auteur)
          .replace(/\[DATE\]/g, date_creation)
          .replace(/\[LIEU\]/g, location);

        try {
          // Check if the 'status' field equals "signé"
          if (data.contratData.status === "signé") {
            let listeSignatureContractants = contractants
              .map((contractant) => {
                const dateSignature = contractant.date_signature
                  ? contractant.date_signature.substring(0, 19)
                  : "Date non disponible";
                return `<td><b>${contractant.genre} ${contractant.nom} ${contractant.prenom}</b><br><br>
                  <img src="${contractant.signature}" ><br><br> le ${dateSignature} </td><br>`;
              })
              .join(" ");

            listeSignatureContractants =
              "<center><table  cellspacing='20'><tr>" +
              listeSignatureContractants +
              "</tr></table></center>";
            htmlContent = htmlContent.replace(
              /\[EN COURS DE SIGNATURE PAR TOUS LES CONTRACTANTS\]/g,
              listeSignatureContractants,
            );
          }
        } catch (error) {
          return {
            message:
              "cloudBuildContratAdulte :  parsing signature erreur" + error,
          };
        }
      } catch (error) {
        return { message: "Error reading file:" + tempHtmlPath };
      }

      // Store html content in pdf pdfBuffer
      const rawfile = { content: htmlContent };
      const pdfBuffer = await new Promise((resolve, reject) => {
        htmlPdf.generatePdf(rawfile, { format: "A4" }, (error, buffer) => {
          if (error) {
            reject(error);
          } else {
            resolve(buffer);
          }
        });
      });

      // Save the PDF buffer to a temporary file tempPdfPath
      fs.writeFileSync(tempPdfPath, pdfBuffer);

      // Check tempPdfPath existence
      if (!fs.existsSync(tempPdfPath)) {
        return { message: "Fichier tmp pdf manquant : " + tempPdfPath };
      }

      // Upload the PDF to Firebase Storage
      bucket.upload(tempPdfPath, {
        destination: `${contratPDF}`,
      });

      // Check build PDF exists
      const filePDF = bucket.file(modeleHtmlContrat);
      const [existsPDF] = await filePDF.exists();
      if (!existsPDF) {
        return { message: `Faillure build contrat PDF :  ${contratPDF}` };
      }

      // Delete the temporary file after use
      fs.unlinkSync(tempPdfPath);
      fs.unlinkSync(tempHtmlPath);

      // Check deletinon
      if (fs.existsSync(tempPdfPath)) {
        return { message: "Failed to delete temporary file tempPdfPath." };
      }
      if (fs.existsSync(tempHtmlPath)) {
        return { message: "Failed to delete temporary file tempHtmlPath." };
      }

      // Return success response
      return { message: "" };
    } catch (error) {
      console.error("Error processing function:", error);
      return {
        message:
          "postedContratFunction : An error occurred while processing the request." +
          error +
          posCode,
      };
    }
  });
