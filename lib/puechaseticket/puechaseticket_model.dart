import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'puechaseticket_widget.dart' show PuechaseticketWidget;
import 'package:flutter/material.dart';

class PuechaseticketModel extends FlutterFlowModel<PuechaseticketWidget> {
  ///  Local state fields for this page.

  double selectedTicketPrice = 0.0;

  double totalPrice = 0.0;

  double serviceFee = 0.0;

  String? selectedPaymentMethod;

  ///  State fields for stateful widgets in this page.

  // State field(s) for FromStation_DropDown widget.
  String? fromStationDropDownValue1;
  FormFieldController<String>? fromStationDropDownValueController1;
  // State field(s) for FromStation_DropDown widget.
  String? fromStationDropDownValue2;
  FormFieldController<String>? fromStationDropDownValueController2;
  // State field(s) for PaymentMethod_Radio widget.
  FormFieldController<String>? paymentMethodRadioValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get paymentMethodRadioValue =>
      paymentMethodRadioValueController?.value;
}
