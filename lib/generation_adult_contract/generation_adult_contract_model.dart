import '/backend/backend.dart';
import '/components/kilian_app_bar/kilian_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'generation_adult_contract_widget.dart'
    show GenerationAdultContractWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GenerationAdultContractModel
    extends FlutterFlowModel<GenerationAdultContractWidget> {
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
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

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
  // Stores action output result for [Backend Call - Create Document] action in BtnGenerationContrat widget.
  ContratsRecord? contratDataDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in BtnGenerationContrat widget.
  UsersRecord? currentUserContractantDoc;
  // Stores action output result for [Custom Action - buildContratPDF] action in BtnGenerationContrat widget.
  String? resultBuidPDF;
  // Stores action output result for [Custom Action - getDownloadUrl] action in BtnGenerationContrat widget.
  String? urlContratPDFEnAttente;

  @override
  void initState(BuildContext context) {
    kilianAppBarModel = createModel(context, () => KilianAppBarModel());
  }

  @override
  void dispose() {
    kilianAppBarModel.dispose();
    horaireRendezVousFocusNode?.dispose();
    horaireRendezVousTextController?.dispose();

    currentPhoneTxtFocusNode?.dispose();
    currentPhoneTxtTextController?.dispose();
  }
}
