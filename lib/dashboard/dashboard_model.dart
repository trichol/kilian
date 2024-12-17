import '/components/kilian_app_bar_accueil/kilian_app_bar_accueil_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  bool? isNotification;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - doesCollectionExist] action in dashboard widget.
  bool? isCollectionMessage;
  // Stores action output result for [Firestore Query - Query a collection] action in dashboard widget.
  int? nombreNotifications;
  // Model for KilianAppBarAccueil component.
  late KilianAppBarAccueilModel kilianAppBarAccueilModel;
  // State field(s) for typeContratSelected widget.
  FormFieldController<List<String>>? typeContratSelectedValueController;
  String? get typeContratSelectedValue =>
      typeContratSelectedValueController?.value?.firstOrNull;
  set typeContratSelectedValue(String? val) =>
      typeContratSelectedValueController?.value = val != null ? [val] : [];

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
