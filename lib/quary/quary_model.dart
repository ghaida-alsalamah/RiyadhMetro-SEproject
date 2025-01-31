import '/components/stats_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quary_widget.dart' show QuaryWidget;
import 'package:flutter/material.dart';

class QuaryModel extends FlutterFlowModel<QuaryWidget> {
  ///  Local state fields for this page.

  String meesage = ' ';

  ///  State fields for stateful widgets in this page.

  // Model for Stats component.
  late StatsModel statsModel;

  @override
  void initState(BuildContext context) {
    statsModel = createModel(context, () => StatsModel());
  }

  @override
  void dispose() {
    statsModel.dispose();
  }
}
