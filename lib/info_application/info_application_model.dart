import '/components/kilian_app_bar/kilian_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'info_application_widget.dart' show InfoApplicationWidget;
import 'package:flutter/material.dart';

class InfoApplicationModel extends FlutterFlowModel<InfoApplicationWidget> {
  ///  State fields for stateful widgets in this page.

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
