import '/flutter_flow/flutter_flow_util.dart';
import 'pass_reset_log_in_widget.dart' show PassResetLogInWidget;
import 'package:flutter/material.dart';

class PassResetLogInModel extends FlutterFlowModel<PassResetLogInWidget> {
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
