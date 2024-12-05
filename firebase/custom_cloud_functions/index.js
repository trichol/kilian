const admin = require("firebase-admin/app");
admin.initializeApp();

const postedContratFunction = require("./posted_contrat_function.js");
exports.postedContratFunction = postedContratFunction.postedContratFunction;
const deleteBucketFile = require("./delete_bucket_file.js");
exports.deleteBucketFile = deleteBucketFile.deleteBucketFile;
const deleteBucketDirectory = require("./delete_bucket_directory.js");
exports.deleteBucketDirectory = deleteBucketDirectory.deleteBucketDirectory;
