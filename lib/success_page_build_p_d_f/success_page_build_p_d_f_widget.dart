import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:badges/badges.dart' as badges;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'success_page_build_p_d_f_model.dart';
export 'success_page_build_p_d_f_model.dart';

class SuccessPageBuildPDFWidget extends StatefulWidget {
  const SuccessPageBuildPDFWidget({
    super.key,
    this.pdf,
    required this.postedContrat,
  });

  final String? pdf;
  final PostedContratDataStruct? postedContrat;

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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 1.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: Text(
                'KILIAN',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      currentUserDisplayName,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/notification.png',
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: FutureBuilder<int>(
                    future: queryNotificationRecordCount(
                      queryBuilder: (notificationRecord) =>
                          notificationRecord.where(
                        'user',
                        isEqualTo: currentUserReference,
                        isNull: (currentUserReference) == null,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      int badgeCount = snapshot.data!;

                      return badges.Badge(
                        badgeContent: Text(
                          badgeCount.toString(),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        showBadge: true,
                        shape: badges.BadgeShape.circle,
                        badgeColor: const Color(0xFFFF0707),
                        elevation: 2.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 5.0),
                        position: badges.BadgePosition.topStart(),
                        animationType: badges.BadgeAnimationType.scale,
                        toAnimate: true,
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // demande signature
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Notifications'),
                                  content: const Text(
                                      'Envoi d\'une demande  de signature  aux autres contractnats.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: const Text('Annuler'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: const Text('Envoyer'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          // create doc contrat

                          var contratsRecordReference =
                              ContratsRecord.collection.doc();
                          await contratsRecordReference
                              .set(createContratsRecordData(
                            uid: currentUserUid,
                            contratData: updateContratDataStruct(
                              widget.postedContrat?.contratData,
                              clearUnsetFields: false,
                              create: true,
                            ),
                          ));
                          _model.contratCourant =
                              ContratsRecord.getDocumentFromData(
                                  createContratsRecordData(
                                    uid: currentUserUid,
                                    contratData: updateContratDataStruct(
                                      widget.postedContrat?.contratData,
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                  ),
                                  contratsRecordReference);
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('test1'),
                                content: const Text('test1'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Otest1k'),
                                  ),
                                ],
                              );
                            },
                          );
                          // affecte contrat to authenticated user

                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'contrats': FieldValue.arrayUnion(
                                    [_model.contratCourant?.reference]),
                              },
                            ),
                          });
                          // reset iloop
                          FFAppState().iLoop = 0;
                          safeSetState(() {});
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('test3'),
                                content: const Text('test3'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Otest3k'),
                                  ),
                                ],
                              );
                            },
                          );
                          while (FFAppState().iLoop <
                              widget.postedContrat!.contratData
                                  .contractantsData.length) {
                            _model.currentDocUser = await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'uid',
                                isEqualTo: (widget.postedContrat?.contratData
                                        .contractantsData[FFAppState().iLoop])
                                    ?.uid,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (currentUserUid !=
                                _model.currentDocUser?.reference.id) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('testloop1'),
                                    content: Text(currentUserDisplayName),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('loop'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('testloop2'),
                                    content: Text(
                                        _model.currentDocUser!.displayName),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('loop'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              // increment iloop
                              FFAppState().iLoop = FFAppState().iLoop + 1;
                              safeSetState(() {});
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('notification non envoyé'),
                                    content: Text(currentUserDisplayName),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('loop'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                          // reset iloop
                          FFAppState().iLoop = 0;
                          safeSetState(() {});
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('test4'),
                                content: const Text('test4'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Otest4k'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('test2'),
                                content: const Text('test2'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Otest2k'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Envoyé a signé',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 4.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
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
                    if (isAndroid || isiOS) {
                      _model.pdfApp = await actions.downloadPdf(
                        getJsonField(
                          widget.postedContrat?.contratData.toMap(),
                          r'''$.url''',
                        ).toString(),
                      );
                      if (_model.pdfApp!) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Chargement réussi'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Continuer'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Chargement impossible'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('recommencer'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      _model.pdfWeb = await actions.downloadPdfWeb(
                        getJsonField(
                          widget.postedContrat?.contratData.toMap(),
                          r'''$.url''',
                        ).toString(),
                      );
                      if (_model.pdfWeb!) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Chargement réussi'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Continuer'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Chargement impossible'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('recommencer'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }

                    safeSetState(() {});
                  },
                ),
              ].divide(const SizedBox(width: 30.0)),
            ),
            FlutterFlowPdfViewer(
              networkPath: getJsonField(
                widget.postedContrat?.contratData.toMap(),
                r'''$.url''',
              ).toString(),
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.9,
              horizontalScroll: false,
            ),
          ]
              .divide(const SizedBox(height: 10.0))
              .addToStart(const SizedBox(height: 10.0))
              .addToEnd(const SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
