import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resetpass_copy_admin_widget.dart' show ResetpassCopyAdminWidget;
import 'package:flutter/material.dart';

class ResetpassCopyAdminModel
    extends FlutterFlowModel<ResetpassCopyAdminWidget> {
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
