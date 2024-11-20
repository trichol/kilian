const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.deleteBucketFile = functions
  .region("europe-west1")
  .runWith({
    memory: "512MB",
  })
  .https.onCall(async (data, context) => {
    // Write your code below!
    try {
      // Validate input
      if (!data.bucketFile || typeof data.bucketFile !== "string") {
        return { message: "Invalid bucketFile" };
      }
      // Access nested fields
      const bucketFile = data.bucketFile;

      const bucket = admin.storage().bucket();

      // Download the HTML template from Firebase Storage
      const file = bucket.file(bucketFile);

      // Check if the file exists
      const [exists] = await file.exists();
      if (!exists) {
        console.error(bucketFile + " manquant!");
        return { message: `Fichier manquant :  ${bucketFile}` };
      }

      // Delete the file
      await file
        .delete()
        .then(() => {
          console.log(`File ${bucketFile} deleted successfully.`);
        })
        .catch((error) => {
          console.error(`Failed to delete file ${bucketFile}:`, error);
        });

      // Check if the file exists
      const [existsAfter] = await file.exists();
      if (existsAfter) {
        console.error(bucketFile + " présent!");
        return { message: `Le fichier toujours présent :  ${bucketFile}` };
      }

      // Return success response
      return { message: "" };
    } catch (error) {
      console.error("Error processing function:", error);
      return {
        message:
          "deleteBucketFile : An error occurred while processing the request." +
          error,
      };
    }
  });
