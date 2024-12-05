const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.deleteBucketDirectory = functions
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
      const directoryPath = data.bucketFile;

      const bucket = admin.storage().bucket();

      // List all files in the directory
      const [files] = await bucket.getFiles({ prefix: directoryPath });

      // Delete each file in the directory
      const deletePromises = files.map((file) => file.delete());
      await Promise.all(deletePromises);

      console.error(
        `###### KILIAN deleteBucketDirectory "${directoryPath}" deleted successfully.`,
      );

      // Return success response
      return { message: "" };
    } catch (error) {
      console.error("Error processing function:", error);
      return {
        message:
          "###### KILIAN deleteBucketDirectory : An error occurred while processing the request." +
          error,
      };
    }
  });
