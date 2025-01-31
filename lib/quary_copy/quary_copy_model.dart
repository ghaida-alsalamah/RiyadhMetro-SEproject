import '/components/stats_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quary_copy_widget.dart' show QuaryCopyWidget;
import 'package:flutter/material.dart';

class QuaryCopyModel extends FlutterFlowModel<QuaryCopyWidget> {
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
