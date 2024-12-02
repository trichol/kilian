import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:collection/collection.dart';
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
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Champ obligatoire';
    }

    if (val.length < 2) {
      return '2 caractères minimum';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for nickname widget.
  FocusNode? nicknameFocusNode;
  TextEditingController? nicknameTextController;
  String? Function(BuildContext, String?)? nicknameTextControllerValidator;
  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressTextController;
  String? Function(BuildContext, String?)? adressTextControllerValidator;
  String? _adressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Champ obligatoire';
    }

    if (val.length < 8) {
      return 'Minimum 8 caractères';
    }

    return null;
  }

  // Stores action output result for [Custom Action - getAddressSuggestions] action in adress widget.
  List<String>? listSuggested;
  // State field(s) for phone_number widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Champ obligatoire (10 caractères)';
    }

    if (val.length < 10) {
      return ' 10 caractères';
    }

    if (!RegExp('^\\d{10}\$').hasMatch(val)) {
      return 'Format attendu :  10 chiffres';
    }
    return null;
  }

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
      return 'Mauvais format';
    }
    if (val.length > 10) {
      return 'Mauvais format';
    }
    if (!RegExp('^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\\d{4}\$')
        .hasMatch(val)) {
      return 'format attendu jj/mm/aaaa';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in btnProfile widget.
  List<UsersRecord>? listAlreadyReccorded;
  // Stores action output result for [Custom Action - requestNotificationPermissionForUser] action in btnProfile widget.
  bool? notificationGranted;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    adressTextControllerValidator = _adressTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    birthdayTextControllerValidator = _birthdayTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    nicknameFocusNode?.dispose();
    nicknameTextController?.dispose();

    adressFocusNode?.dispose();
    adressTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    birthdayFocusNode?.dispose();
    birthdayTextController?.dispose();
  }
}
