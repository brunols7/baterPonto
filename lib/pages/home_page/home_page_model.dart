import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/failed_component/failed_component_widget.dart';
import '/components/finalizar_horario/finalizar_horario_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in homePage widget.
  List<EmpresaRecord>? empresas;
  // Stores action output result for [Firestore Query - Query a collection] action in homePage widget.
  List<PontoRecord>? registros;
  // State field(s) for empresa widget.
  FormFieldController<List<String>>? empresaValueController;
  String? get empresaValue => empresaValueController?.value?.firstOrNull;
  set empresaValue(String? val) =>
      empresaValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Firestore Query - Query a collection] action in registerBtn widget.
  EmpresaRecord? empresa;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
