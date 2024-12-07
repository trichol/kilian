import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  int? countNotification = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getNotificationCount] action in dashboard widget.
  int? computeCountNotification;
  // State field(s) for typeContratSelected widget.
  FormFieldController<List<String>>? typeContratSelectedValueController;
  String? get typeContratSelectedValue =>
      typeContratSelectedValueController?.value?.firstOrNull;
  set typeContratSelectedValue(String? val) =>
      typeContratSelectedValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
