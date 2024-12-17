const admin = require("firebase-admin/app");
admin.initializeApp();

const cloudBuildContratAdulte = require("./cloud_build_contrat_adulte.js");
exports.cloudBuildContratAdulte =
  cloudBuildContratAdulte.cloudBuildContratAdulte;
const cloudBuildContratCessation = require("./cloud_build_contrat_cessation.js");
exports.cloudBuildContratCessation =
  cloudBuildContratCessation.cloudBuildContratCessation;
const cloudBuildContratVente = require("./cloud_build_contrat_vente.js");
exports.cloudBuildContratVente = cloudBuildContratVente.cloudBuildContratVente;
const deleteBucketFile = require("./delete_bucket_file.js");
exports.deleteBucketFile = deleteBucketFile.deleteBucketFile;
const deleteBucketDirectory = require("./delete_bucket_directory.js");
exports.deleteBucketDirectory = deleteBucketDirectory.deleteBucketDirectory;
