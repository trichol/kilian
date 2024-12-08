import '/backend/backend.dart';
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

  ContratDataStruct? contratData;
  void updateContratDataStruct(Function(ContratDataStruct) updateFn) {
    updateFn(contratData ??= ContratDataStruct());
  }

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

  PostedContratDataStruct? postedContratData;
  void updatePostedContratDataStruct(
      Function(PostedContratDataStruct) updateFn) {
    updateFn(postedContratData ??= PostedContratDataStruct());
  }

  String? resultat;

  String? phoneNumberController;

  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

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
  // Stores action output result for [Firestore Query - Query a collection] action in BtnValidation widget.
  UsersRecord? currentUserDoc;
  // Stores action output result for [Custom Action - callPostedContratFunction] action in BtnValidation widget.
  String? resultBuidPDF;
  // Stores action output result for [Custom Action - getDownloadUrl] action in BtnValidation widget.
  String? urlContratPDFDraft;
  // Stores action output result for [Custom Action - callDeleteBucketFile] action in BtnValidation widget.
  String? resultDeletionPDF;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    currentPhoneTxtFocusNode?.dispose();
    currentPhoneTxtTextController?.dispose();
  }
}
