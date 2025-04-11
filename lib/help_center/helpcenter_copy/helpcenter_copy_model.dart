import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'helpcenter_copy_widget.dart' show HelpcenterCopyWidget;
import 'package:flutter/material.dart';

class HelpcenterCopyModel extends FlutterFlowModel<HelpcenterCopyWidget> {
  ///  Local state fields for this page.

  String? query = '\"\"';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
