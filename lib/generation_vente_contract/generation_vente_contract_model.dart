import '/backend/backend.dart';
import '/components/kilian_app_bar/kilian_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'generation_vente_contract_widget.dart'
    show GenerationVenteContractWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GenerationVenteContractModel
    extends FlutterFlowModel<GenerationVenteContractWidget> {
  ///  Local state fields for this page.

  List<String> listPhoneContractantValide = [];
  void addToListPhoneContractantValide(String item) =>
      listPhoneContractantValide.add(item);
  void removeFromListPhoneContractantValide(String item) =>
      listPhoneContractantValide.remove(item);
  void removeAtIndexFromListPhoneContractantValide(int index) =>
      listPhoneContractantValide.removeAt(index);
  void insertAtIndexInListPhoneContractantValide(int index, String item) =>
      listPhoneContractantValide.insert(index, item);
  void updateListPhoneContractantValideAtIndex(
          int index, Function(String) updateFn) =>
      listPhoneContractantValide[index] =
          updateFn(listPhoneContractantValide[index]);

  List<ObjetContratStruct> listObjetContrat = [];
  void addToListObjetContrat(ObjetContratStruct item) =>
      listObjetContrat.add(item);
  void removeFromListObjetContrat(ObjetContratStruct item) =>
      listObjetContrat.remove(item);
  void removeAtIndexFromListObjetContrat(int index) =>
      listObjetContrat.removeAt(index);
  void insertAtIndexInListObjetContrat(int index, ObjetContratStruct item) =>
      listObjetContrat.insert(index, item);
  void updateListObjetContratAtIndex(
          int index, Function(ObjetContratStruct) updateFn) =>
      listObjetContrat[index] = updateFn(listObjetContrat[index]);

  List<ContractantDataStruct> listContractants = [];
  void addToListContractants(ContractantDataStruct item) =>
      listContractants.add(item);
  void removeFromListContractants(ContractantDataStruct item) =>
      listContractants.remove(item);
  void removeAtIndexFromListContractants(int index) =>
      listContractants.removeAt(index);
  void insertAtIndexInListContractants(int index, ContractantDataStruct item) =>
      listContractants.insert(index, item);
  void updateListContractantsAtIndex(
          int index, Function(ContractantDataStruct) updateFn) =>
      listContractants[index] = updateFn(listContractants[index]);

  String? phoneNumberController;

  bool isBuildAction = true;

  ///  State fields for stateful widgets in this page.

  // Model for KilianAppBar component.
  late KilianAppBarModel kilianAppBarModel;
  // State field(s) for choiceTypeContractant widget.
  FormFieldController<List<String>>? choiceTypeContractantValueController;
  String? get choiceTypeContractantValue =>
      choiceTypeContractantValueController?.value?.firstOrNull;
  set choiceTypeContractantValue(String? val) =>
      choiceTypeContractantValueController?.value = val != null ? [val] : [];
  // State field(s) for article widget.
  FocusNode? articleFocusNode;
  TextEditingController? articleTextController;
  String? Function(BuildContext, String?)? articleTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for prix widget.
  FocusNode? prixFocusNode;
  TextEditingController? prixTextController;
  String? Function(BuildContext, String?)? prixTextControllerValidator;
  // State field(s) for CheckboxEnlEtat widget.
  bool? checkboxEnlEtatValue;
  // State field(s) for CheckboxEstFonctionnel widget.
  bool? checkboxEstFonctionnelValue;
  // State field(s) for horaireRendezVous widget.
  FocusNode? horaireRendezVousFocusNode;
  TextEditingController? horaireRendezVousTextController;
  final horaireRendezVousMask =
      MaskTextInputFormatter(mask: '##/##/#### ##:##');
  String? Function(BuildContext, String?)?
      horaireRendezVousTextControllerValidator;
  // State field(s) for currentPhoneTxt widget.
  FocusNode? currentPhoneTxtFocusNode;
  TextEditingController? currentPhoneTxtTextController;
  final currentPhoneTxtMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)?
      currentPhoneTxtTextControllerValidator;
  // Stores action output result for [Custom Action - pickPhoneNumber] action in IconButton widget.
  String? selectedPhoneNumber;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<UsersRecord>? userByPhoneFoundList;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<UsersRecord>? itemPhoneCur;
  // Stores action output result for [Backend Call - Create Document] action in BtnGenerationContratVente widget.
  ContratsRecord? contratDataDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in BtnGenerationContratVente widget.
  UsersRecord? currentUserContractantDoc;
  // Stores action output result for [Custom Action - buildContratPDF] action in BtnGenerationContratVente widget.
  String? resultBuidPDF;
  // Stores action output result for [Custom Action - getDownloadUrl] action in BtnGenerationContratVente widget.
  String? urlContratPDFEnAttente;

  @override
  void initState(BuildContext context) {
    kilianAppBarModel = createModel(context, () => KilianAppBarModel());
  }

  @override
  void dispose() {
    kilianAppBarModel.dispose();
    articleFocusNode?.dispose();
    articleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    prixFocusNode?.dispose();
    prixTextController?.dispose();

    horaireRendezVousFocusNode?.dispose();
    horaireRendezVousTextController?.dispose();

    currentPhoneTxtFocusNode?.dispose();
    currentPhoneTxtTextController?.dispose();
  }
}
