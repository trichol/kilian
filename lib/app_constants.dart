
abstract class FFAppConstants {
  static const String urlInstallationKilianAndroid =
      'https://play.googleapis.com/download/playconsole/AOTCm0QM5iOdOvOqTNOCwL3JscrRjXMm-YjLW7um9LAoFtYX25duhG6rr2BWHTs5ZLDhM0KxkvNTwisHA4VVC3Lq7dW5IGQc5Vwbsse9iEQNvKmaZbzAbiQHMbMpivxANZ545VqV7qTIOE8AKZsZ-w5-J3deCkA51EFivPVwbi-QIZb1eAUpG38Ae-SlHFl2kzpF';
  static const String urlInstallationKilianIos =
      'https://www.kilian.freepartner.fr';
  static const String repertoireContratsEnCours = 'TMP/contrats/';
  static const String repertoireUserContrats = 'contrats';
  static const List<String> listeTypeContrat = [
    'Contrat de consentement entre adulte',
    'Contrat de vente entre particulier',
    'Contrat de cessation entre particulier'
  ];
  static const List<String> listeStatus = [
    'en attente',
    'à supprimer',
    'signé',
    'à traiter'
  ];
  static const List<String> listeLabelContrat = [
    'Adulte',
    'Vente',
    'Cessation'
  ];
  static const int indiceAdulte = 0;
  static const int indiceVente = 1;
  static const int indiceCessation = 2;
  static const int indiceEnAttente = 0;
  static const int indiceASupprimer = 1;
  static const int indiceSigne = 2;
  static const List<String> listeFichierContrat = [
    'MODELE/modele_contrat_adulte.html',
    'MODELE/modele_contrat_vente.html',
    'MODELE/modele_contrat_cessation.html'
  ];
  static const int indiceATraiter = 3;
}
