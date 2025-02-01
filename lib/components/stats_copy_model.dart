import '/flutter_flow/flutter_flow_util.dart';
import 'stats_copy_widget.dart' show StatsCopyWidget;
import 'package:flutter/material.dart';

class StatsCopyModel extends FlutterFlowModel<StatsCopyWidget> {
  ///  Local state fields for this component.

  String replay = '   ';

  ///  State fields for stateful widgets in this component.

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
