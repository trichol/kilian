import '/components/kilian_app_bar_back/kilian_app_bar_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'success_page_build_p_d_f_widget.dart' show SuccessPageBuildPDFWidget;
import 'package:flutter/material.dart';

class SuccessPageBuildPDFModel
    extends FlutterFlowModel<SuccessPageBuildPDFWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkFileExists] action in successPageBuildPDF widget.
  bool? isUrlContratPdfValid;
  // Model for KilianAppBarBack component.
  late KilianAppBarBackModel kilianAppBarBackModel;

  @override
  void initState(BuildContext context) {
    kilianAppBarBackModel = createModel(context, () => KilianAppBarBackModel());
  }

  @override
  void dispose() {
    kilianAppBarBackModel.dispose();
  }
}
