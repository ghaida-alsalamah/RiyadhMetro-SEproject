import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_reset_log_in_widget.dart' show AdminResetLogInWidget;
import 'package:flutter/material.dart';

class AdminResetLogInModel extends FlutterFlowModel<AdminResetLogInWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
