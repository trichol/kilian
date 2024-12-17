import '/components/kilian_app_bar_back/kilian_app_bar_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for KilianAppBarBack component.
  late KilianAppBarBackModel kilianAppBarBackModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Champ obligatoire';
    }

    if (val.length < 6) {
      return '6 caractères minimum';
    }
    if (val.length > 30) {
      return '30 caractère maximum';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Format invalid';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    kilianAppBarBackModel = createModel(context, () => KilianAppBarBackModel());
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
  }

  @override
  void dispose() {
    kilianAppBarBackModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
