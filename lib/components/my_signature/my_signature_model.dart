import '/flutter_flow/flutter_flow_util.dart';
import 'my_signature_widget.dart' show MySignatureWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class MySignatureModel extends FlutterFlowModel<MySignatureWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Signature widget.
  SignatureController? signatureController;
  String uploadedSignatureUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    signatureController?.dispose();
  }
}
