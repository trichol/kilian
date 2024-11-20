const functions = require("firebase-functions");
const admin = require("firebase-admin");
const path = require("path");
const os = require("os");
const fs = require("fs");
const htmlPdf = require("html-pdf-node");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.postedContratFunction = functions
  .region("europe-west1")
  .runWith({
    memory: "512MB",
  })
  .https.onCall(async (data, context) => {
    // Write your code below!
    try {
      // Validate input
      if (
        !data.modeleHtmlContrat ||
        typeof data.modeleHtmlContrat !== "string"
      ) {
        return { message: "Invalid modeleHtmlContrat" };
      }
      if (!data.contratPDF || typeof data.contratPDF !== "string") {
        return { message: "Invalid contratPDF" };
      }
      if (!data.contratData || typeof data.contratData !== "object") {
        return { message: "Invalid contratData" };
      }
      // Access nested fields
      const modeleHtmlContrat = data.modeleHtmlContrat;
      const contratPDF = data.contratPDF;
      const contratData = data.contratData;
      const title = contratData.title;
      const status = contratData.status;
      const auteur = contratData.auteur;
      const location = contratData.location;
      let date_creation = contratData.date_creation.substring(0, 19);
      const contractants = contratData.contractantsData || [];
      const objetsContrat = contratData.objetsContrat || [];

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
          (contractant) =>
            `<b>${contractant.genre} ${contractant.nom} ${contractant.prenom}</b>`,
        )
        .join(", ");
      const listePratiquesContractualisee = objetsContrat
        .map((objetContrat) => `<li>${objetContrat.titre}</li>`)
        .join(", ");

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
          .replace(/\[BB\]/g, listePratiquesContractualisee)
          .replace(/\[AUTEUR\]/g, auteur)
          .replace(/\[DATE\]/g, date_creation)
          .replace(/\[LIEU\]/g, location);
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
          error,
      };
    }
  });
