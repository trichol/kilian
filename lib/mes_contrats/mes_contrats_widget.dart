import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/kilian_app_bar/kilian_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mes_contrats_model.dart';
export 'mes_contrats_model.dart';

class MesContratsWidget extends StatefulWidget {
  const MesContratsWidget({super.key});

  @override
  State<MesContratsWidget> createState() => _MesContratsWidgetState();
}

class _MesContratsWidgetState extends State<MesContratsWidget> {
  late MesContratsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MesContratsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.logAction(
        'appel mesContrats',
      );
      _model.isPageLoaded = false;
      safeSetState(() {});
      // complete contractant
      await actions.completeContractant();
      await actions.updateMessageStatus(
        currentPhoneNumber,
        FFAppConstants.listeStatus
            .elementAtOrNull(FFAppConstants.indiceATraiter),
      );
      // Gestion en cours
      await _model.gestionContratEnCours(context);
      safeSetState(() {});
      // Gestion archive
      await _model.gestionContratArchive(context);
      _model.isPageLoaded = true;
      safeSetState(() {});
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 50.0,
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.kilianAppBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const KilianAppBarWidget(),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (_model.isPageLoaded ?? false) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 5.0, 0.0, 20.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Builder(
                              builder: (context) {
                                if (_model.listeContratEnAttente.isNotEmpty) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 5.0, 16.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Contrat(s) en attente de signature :',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final listView1Content = _model
                                                .listeContratEnAttente
                                                .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listView1Content.length,
                                              itemBuilder: (context,
                                                  listView1ContentIndex) {
                                                final listView1ContentItem =
                                                    listView1Content[
                                                        listView1ContentIndex];
                                                return Visibility(
                                                  visible: (listView1ContentItem
                                                              .nombreMessage ==
                                                          listView1ContentItem
                                                              .contractantsData
                                                              .length) ||
                                                      (listView1ContentItem
                                                              .auteurId ==
                                                          currentUserUid),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    4.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          4.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Wrap(
                                                                    spacing:
                                                                        10.0,
                                                                    runSpacing:
                                                                        10.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    children: [
                                                                      AutoSizeText(
                                                                        listView1ContentItem
                                                                            .title
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              150,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        maxLines:
                                                                            3,
                                                                        minFontSize:
                                                                            12.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Mukta',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (!functions.isContratSignedByContractant(
                                                                              listView1ContentItem,
                                                                              currentUserUid)! &&
                                                                          (listView1ContentItem.contractantsData.length ==
                                                                              listView1ContentItem
                                                                                  .nombreMessage)) {
                                                                        return FlutterFlowIconButton(
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          borderRadius:
                                                                              4.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              45.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.fileSignature,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            // initialisation app state contrat data
                                                                            FFAppState().contratDataAppState =
                                                                                listView1ContentItem;
                                                                            safeSetState(() {});
                                                                            await action_blocks.blockSignerContrat(context);
                                                                            FFAppState().contratDataAppState =
                                                                                ContratDataStruct();
                                                                            FFAppState().update(() {});
                                                                            // reload page
                                                                            if (Navigator.of(context).canPop()) {
                                                                              context.pop();
                                                                            }
                                                                            context.pushNamed('mesContrats');
                                                                          },
                                                                        );
                                                                      } else if (functions.isContratSignedByContractant(
                                                                              listView1ContentItem,
                                                                              currentUserUid)! &&
                                                                          (listView1ContentItem.contractantsData.length ==
                                                                              listView1ContentItem
                                                                                  .nombreMessage)) {
                                                                        return Container(
                                                                          width:
                                                                              110.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Wrap(
                                                                                spacing: 10.0,
                                                                                runSpacing: 10.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.horizontal,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: [
                                                                                  Text(
                                                                                    'Signé',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Mukta',
                                                                                          color: FlutterFlowTheme.of(context).success,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Expanded(
                                                                                child: Wrap(
                                                                                  spacing: 0.0,
                                                                                  runSpacing: 0.0,
                                                                                  alignment: WrapAlignment.spaceEvenly,
                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                  direction: Axis.horizontal,
                                                                                  runAlignment: WrapAlignment.start,
                                                                                  verticalDirection: VerticalDirection.down,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  children: [
                                                                                    AutoSizeText(
                                                                                      'En attente d\'autres signatures',
                                                                                      textAlign: TextAlign.start,
                                                                                      maxLines: 2,
                                                                                      minFontSize: 10.0,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Mukta',
                                                                                            fontSize: 11.0,
                                                                                            letterSpacing: 0.0,
                                                                                            lineHeight: 1.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      } else if (listView1ContentItem
                                                                              .nombreMessage <
                                                                          listView1ContentItem
                                                                              .contractantsData
                                                                              .length) {
                                                                        return Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Wrap(
                                                                                spacing: 10.0,
                                                                                runSpacing: 10.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.horizontal,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: [
                                                                                  Text(
                                                                                    'Rerjeté',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Mukta',
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Expanded(
                                                                                child: Wrap(
                                                                                  spacing: 0.0,
                                                                                  runSpacing: 0.0,
                                                                                  alignment: WrapAlignment.spaceEvenly,
                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                  direction: Axis.horizontal,
                                                                                  runAlignment: WrapAlignment.start,
                                                                                  verticalDirection: VerticalDirection.down,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  children: [
                                                                                    AutoSizeText(
                                                                                      'Il y a eu un refus de signature',
                                                                                      textAlign: TextAlign.start,
                                                                                      maxLines: 2,
                                                                                      minFontSize: 10.0,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Mukta',
                                                                                            fontSize: 11.0,
                                                                                            letterSpacing: 0.0,
                                                                                            lineHeight: 1.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Etat inconnu',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Mukta',
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Icon(
                                                                                Icons.warning_rounded,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 18.0,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    borderRadius:
                                                                        4.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        45.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .visibility,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'viewPdfContrat',
                                                                        queryParameters:
                                                                            {
                                                                          'url':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              listView1ContentItem.toMap(),
                                                                              r'''$.url''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    borderRadius:
                                                                        4.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        45.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .delete_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      if (listView1ContentItem
                                                                              .auteurId ==
                                                                          currentUserUid) {
                                                                        await actions
                                                                            .callDeleteBucketFile(
                                                                          listView1ContentItem
                                                                              .contratPDF,
                                                                        );
                                                                        await actions
                                                                            .deleteFirestoreDocument(
                                                                          'contrats',
                                                                          listView1ContentItem
                                                                              .uid,
                                                                        );
                                                                        // delete all document message
                                                                        await actions
                                                                            .deleteAllDocumentsMessage(
                                                                          listView1ContentItem
                                                                              .uid,
                                                                        );
                                                                      } else {
                                                                        // delete user message contrat Id
                                                                        await actions
                                                                            .deleteDocumentsMessage(
                                                                          currentPhoneNumber,
                                                                          listView1ContentItem
                                                                              .auteurId,
                                                                        );
                                                                      }

                                                                      await actions
                                                                          .incrementNombreMessage(
                                                                        listView1ContentItem
                                                                            .uid,
                                                                        false,
                                                                      );
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('Opération réussie'),
                                                                            content:
                                                                                const Text('Le contrat a été supprimé'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: const Text('Continuer'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      FFAppState()
                                                                          .iLoop = 0;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 20.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(4.0),
                                            bottomRight: Radius.circular(4.0),
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(4.0),
                                              bottomRight: Radius.circular(4.0),
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                            border: Border.all(
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: Text(
                                              'Aucun contrat en attente de signature.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Builder(
                              builder: (context) {
                                if (_model.listContratSigned.isNotEmpty) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 5.0, 16.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Historique de vos contrats :',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final listView2Content = _model
                                                .listContratSigned
                                                .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listView2Content.length,
                                              itemBuilder: (context,
                                                  listView2ContentIndex) {
                                                final listView2ContentItem =
                                                    listView2Content[
                                                        listView2ContentIndex];
                                                return Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 2.0,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    4.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Wrap(
                                                                  spacing: 10.0,
                                                                  runSpacing:
                                                                      10.0,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      listView2ContentItem
                                                                          .label
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            150,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          3,
                                                                      minFontSize:
                                                                          12.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Mukta',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                  borderRadius:
                                                                      4.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      45.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .download,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    FFAppState()
                                                                            .contratDataAppState =
                                                                        ContratDataStruct();
                                                                    safeSetState(
                                                                        () {});
                                                                    FFAppState()
                                                                        .updateContratDataAppStateStruct(
                                                                      (e) => e
                                                                        ..url =
                                                                            listView2ContentItem.url,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    await action_blocks
                                                                        .downloadPdf(
                                                                            context);
                                                                  },
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                  borderRadius:
                                                                      4.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      45.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .visibility,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    // decrytp file
                                                                    _model.decryptedFile =
                                                                        await actions
                                                                            .decryptAndDownload(
                                                                      listView2ContentItem
                                                                          .value,
                                                                    );

                                                                    context
                                                                        .pushNamed(
                                                                      'viewPdfContrat',
                                                                      queryParameters:
                                                                          {
                                                                        'url':
                                                                            serializeParam(
                                                                          _model
                                                                              .decryptedFile,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                  borderRadius:
                                                                      4.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      45.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .delete_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await actions
                                                                        .callDeleteBucketFile(
                                                                      listView2ContentItem
                                                                          .value,
                                                                    );
                                                                    await actions
                                                                        .removeUrlContratByValue(
                                                                      currentUserUid,
                                                                      listView2ContentItem
                                                                          .value,
                                                                    );
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Opération réussie'),
                                                                          content:
                                                                              const Text('Le contrat a été supprimé'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Continuer'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (Navigator.of(
                                                                            context)
                                                                        .canPop()) {
                                                                      context
                                                                          .pop();
                                                                    }
                                                                    context.pushNamed(
                                                                        'mesContrats');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 20.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(4.0),
                                            bottomRight: Radius.circular(4.0),
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(4.0),
                                              bottomRight: Radius.circular(4.0),
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                            border: Border.all(
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: Text(
                                              'Aucun contrat archivé!',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ].divide(const SizedBox(height: 20.0)),
                        ),
                      );
                    } else {
                      return Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 200.0, 0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Animation_-_1734414688819.gif',
                                width: 150.0,
                                height: 150.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
