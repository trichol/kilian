import '/components/kilian_app_bar_accueil/kilian_app_bar_accueil_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quitter_widget.dart' show QuitterWidget;
import 'package:flutter/material.dart';

class QuitterModel extends FlutterFlowModel<QuitterWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for KilianAppBarAccueil component.
  late KilianAppBarAccueilModel kilianAppBarAccueilModel;

  @override
  void initState(BuildContext context) {
    kilianAppBarAccueilModel =
        createModel(context, () => KilianAppBarAccueilModel());
  }

  @override
  void dispose() {
    kilianAppBarAccueilModel.dispose();
  }
}
