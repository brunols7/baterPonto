import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/failed_component/failed_component_widget.dart';
import '/components/sucess_component/sucess_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  bool editMode = false;

  bool uploadImage = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for nomeUsuario widget.
  FocusNode? nomeUsuarioFocusNode1;
  TextEditingController? nomeUsuarioTextController1;
  String? Function(BuildContext, String?)? nomeUsuarioTextController1Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode1;
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberTextController1;
  final phoneNumberMask1 = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? phoneNumberTextController1Validator;
  // State field(s) for empresaText widget.
  FocusNode? empresaTextFocusNode;
  TextEditingController? empresaTextTextController;
  String? Function(BuildContext, String?)? empresaTextTextControllerValidator;
  // State field(s) for nomeUsuario widget.
  FocusNode? nomeUsuarioFocusNode2;
  TextEditingController? nomeUsuarioTextController2;
  String? Function(BuildContext, String?)? nomeUsuarioTextController2Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode2;
  TextEditingController? emailTextController2;
  String? Function(BuildContext, String?)? emailTextController2Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberTextController2;
  final phoneNumberMask2 = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? phoneNumberTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nomeUsuarioFocusNode1?.dispose();
    nomeUsuarioTextController1?.dispose();

    emailFocusNode1?.dispose();
    emailTextController1?.dispose();

    phoneNumberFocusNode1?.dispose();
    phoneNumberTextController1?.dispose();

    empresaTextFocusNode?.dispose();
    empresaTextTextController?.dispose();

    nomeUsuarioFocusNode2?.dispose();
    nomeUsuarioTextController2?.dispose();

    emailFocusNode2?.dispose();
    emailTextController2?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberTextController2?.dispose();
  }
}
