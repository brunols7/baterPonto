import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sucess_component/sucess_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'finalizar_horario_model.dart';
export 'finalizar_horario_model.dart';

class FinalizarHorarioWidget extends StatefulWidget {
  const FinalizarHorarioWidget({
    super.key,
    required this.idPonto,
  });

  final String? idPonto;

  @override
  State<FinalizarHorarioWidget> createState() => _FinalizarHorarioWidgetState();
}

class _FinalizarHorarioWidgetState extends State<FinalizarHorarioWidget> {
  late FinalizarHorarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinalizarHorarioModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PontoRecord>>(
      stream: queryPontoRecord(
        queryBuilder: (pontoRecord) => pontoRecord.where(
          'idPonto',
          isEqualTo: widget.idPonto,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitDoubleBounce(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<PontoRecord> containerPontoRecordList = snapshot.data!;
        final containerPontoRecord = containerPontoRecordList.isNotEmpty
            ? containerPontoRecordList.first
            : null;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).secondaryBackground,
                FlutterFlowTheme.of(context).alternate
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.77, -1.0),
              end: AlignmentDirectional(-0.77, 1.0),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.chevron_left_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 28.0,
                    ),
                    Expanded(
                      child: Text(
                        'Registrar saída',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Remover Registro'),
                                  content: Text(
                                      'Você deseja remover o Registro de Horário ?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirmar'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          await containerPontoRecord!.reference.delete();
                        }
                      },
                      child: Icon(
                        Icons.delete_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ].divide(SizedBox(width: 15.0)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Horário de Entrada: ${dateTimeFormat('d/M h:mm a', containerPontoRecord?.entrada)}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      if (containerPontoRecord?.saida != null)
                        Text(
                          'Horário de Saída: ${dateTimeFormat('d/M h:mm a', containerPontoRecord?.saida)}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      if (containerPontoRecord?.saida == null)
                        FFButtonWidget(
                          onPressed: (containerPontoRecord?.saida != null)
                              ? null
                              : () async {
                                  await containerPontoRecord!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'saida': FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  Navigator.pop(context);
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SucessComponentWidget(
                                          text: 'Horário de saída marcado',
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                          text: 'Registrar Horário de Saída',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).onContainer,
                            disabledTextColor:
                                FlutterFlowTheme.of(context).error,
                          ),
                        ),
                    ].divide(SizedBox(height: 15.0)),
                  ),
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        );
      },
    );
  }
}
