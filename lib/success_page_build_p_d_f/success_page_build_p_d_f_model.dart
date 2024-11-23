import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'success_page_build_p_d_f_widget.dart' show SuccessPageBuildPDFWidget;
import 'package:flutter/material.dart';

class SuccessPageBuildPDFModel
    extends FlutterFlowModel<SuccessPageBuildPDFWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ContratsRecord? contratCourant;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? currentDocUser;
  // Stores action output result for [Custom Action - downloadPdf] action in IconButton widget.
  bool? pdfApp;
  // Stores action output result for [Custom Action - downloadPdfWeb] action in IconButton widget.
  bool? pdfWeb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
