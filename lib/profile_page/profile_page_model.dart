import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  List<String> addressSuggestions = [];
  void addToAddressSuggestions(String item) => addressSuggestions.add(item);
  void removeFromAddressSuggestions(String item) =>
      addressSuggestions.remove(item);
  void removeAtIndexFromAddressSuggestions(int index) =>
      addressSuggestions.removeAt(index);
  void insertAtIndexInAddressSuggestions(int index, String item) =>
      addressSuggestions.insert(index, item);
  void updateAddressSuggestionsAtIndex(int index, Function(String) updateFn) =>
      addressSuggestions[index] = updateFn(addressSuggestions[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceReadOrWrite widget.
  FormFieldController<List<String>>? choiceReadOrWriteValueController;
  String? get choiceReadOrWriteValue =>
      choiceReadOrWriteValueController?.value?.firstOrNull;
  set choiceReadOrWriteValue(String? val) =>
      choiceReadOrWriteValueController?.value = val != null ? [val] : [];
  // State field(s) for SelectorGenre widget.
  String? selectorGenreValue;
  FormFieldController<String>? selectorGenreValueController;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for nickname widget.
  FocusNode? nicknameFocusNode;
  TextEditingController? nicknameTextController;
  String? Function(BuildContext, String?)? nicknameTextControllerValidator;
  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressTextController;
  String? Function(BuildContext, String?)? adressTextControllerValidator;
  // Stores action output result for [Custom Action - getAddressSuggestions] action in adress widget.
  List<String>? listSuggested;
  // State field(s) for birthday widget.
  FocusNode? birthdayFocusNode;
  TextEditingController? birthdayTextController;
  final birthdayMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? birthdayTextControllerValidator;
  String? _birthdayTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Champ obligatoire';
    }

    if (val.length < 10) {
      return 'Format attendu jj/mm/aaaa';
    }
    if (val.length > 10) {
      return 'Format attendu jj/mm/aaaa';
    }
    if (!RegExp('^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\\d{4}\$')
        .hasMatch(val)) {
      return 'Format attendu jj/mm/aaaa';
    }
    return null;
  }

  // State field(s) for phone_number widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Format attendu :  10 chiffres';
    }

    if (val.length < 10) {
      return 'Format attendu :  10 chiffres';
    }

    if (!RegExp('^\\d{10}\$').hasMatch(val)) {
      return 'Format attendu :  10 chiffres';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    birthdayTextControllerValidator = _birthdayTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    nicknameFocusNode?.dispose();
    nicknameTextController?.dispose();

    adressFocusNode?.dispose();
    adressTextController?.dispose();

    birthdayFocusNode?.dispose();
    birthdayTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
