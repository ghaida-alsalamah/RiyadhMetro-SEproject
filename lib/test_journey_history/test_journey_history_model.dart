import '/components/no_journeys_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'test_journey_history_widget.dart' show TestJourneyHistoryWidget;
import 'package:flutter/material.dart';

class TestJourneyHistoryModel
    extends FlutterFlowModel<TestJourneyHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NoJourneys component.
  late NoJourneysModel noJourneysModel;

  @override
  void initState(BuildContext context) {
    noJourneysModel = createModel(context, () => NoJourneysModel());
  }

  @override
  void dispose() {
    noJourneysModel.dispose();
  }
}
