import '/components/kilian_app_bar/kilian_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_pdf_contrat_widget.dart' show ViewPdfContratWidget;
import 'package:flutter/material.dart';

class ViewPdfContratModel extends FlutterFlowModel<ViewPdfContratWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkFileExists] action in viewPdfContrat widget.
  bool? isUrlContratPdfValid;
  // Model for KilianAppBar component.
  late KilianAppBarModel kilianAppBarModel;

  @override
  void initState(BuildContext context) {
    kilianAppBarModel = createModel(context, () => KilianAppBarModel());
  }

  @override
  void dispose() {
    kilianAppBarModel.dispose();
  }
}
