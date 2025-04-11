import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chatbot_wquestion_widget.dart' show ChatbotWquestionWidget;
import 'package:flutter/material.dart';

class ChatbotWquestionModel extends FlutterFlowModel<ChatbotWquestionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in btn_submit widget.
  String? response;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
