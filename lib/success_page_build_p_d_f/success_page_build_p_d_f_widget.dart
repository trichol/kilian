import '/auth/firebase_auth/auth_util.dart';
import '/components/kilian_app_bar_back/kilian_app_bar_back_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'success_page_build_p_d_f_model.dart';
export 'success_page_build_p_d_f_model.dart';

class SuccessPageBuildPDFWidget extends StatefulWidget {
  const SuccessPageBuildPDFWidget({super.key});

  @override
  State<SuccessPageBuildPDFWidget> createState() =>
      _SuccessPageBuildPDFWidgetState();
}

class _SuccessPageBuildPDFWidgetState extends State<SuccessPageBuildPDFWidget> {
  late SuccessPageBuildPDFModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccessPageBuildPDFModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // CHECK PDF EXISTS
      _model.isUrlContratPdfValid = await actions.checkFileExists(
        getJsonField(
          FFAppState().contratDataAppState.toMap(),
          r'''$.url''',
        ).toString().toString(),
      );
      if (_model.isUrlContratPdfValid!) {
        if (FFAppState().contratDataAppState.allContractantsRegistered !=
            true) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: const Text('Note informative'),
                content: const Text(
                    'Le contrat sera dûment completé lorsque le(s) contractant(s) pas encore enregistré(s) s\'authentifieront à l\'application. Un message a été envoyé pour le(s) avertir de votre proposition!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Continuer'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Affichage du contrat impossible'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Continuer'),
                ),
              ],
            );
          },
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: wrapWithModel(
                  model: _model.kilianAppBarBackModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const KilianAppBarBackWidget(),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Télécharger brouillon contrat',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Mukta',
                          letterSpacing: 0.0,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).secondary,
                    borderRadius: 4.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.download_for_offline,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await action_blocks.downloadPdf(context);
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Signer',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mukta',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).secondary,
                    borderRadius: 4.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.fileSignature,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await action_blocks.blockSignerContrat(context);

                      context.pushNamed('dashboard');
                    },
                  ),
                ].divide(const SizedBox(width: 5.0)),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: FlutterFlowPdfViewer(
                  networkPath: getJsonField(
                    FFAppState().contratDataAppState.toMap(),
                    r'''$.url''',
                  ).toString(),
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  horizontalScroll: false,
                ),
              ),
            ].divide(const SizedBox(height: 10.0)).addToEnd(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
