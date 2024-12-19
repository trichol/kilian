import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/kilian_app_bar_accueil/kilian_app_bar_accueil_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    super.key,
    this.contractTypeSelected,
    bool? isGetStared,
  }) : isGetStared = isGetStared ?? false;

  final String? contractTypeSelected;
  final bool isGetStared;

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // LOG
      await actions.logAction(
        'dashboard :  onload init :${valueOrDefault<bool>(currentUserDocument?.isCompleteRegistration, false).toString()}',
      );
      if (!valueOrDefault<bool>(
          currentUserDocument?.isCompleteRegistration, false)) {
        await Future.delayed(const Duration(milliseconds: 2000));
      }
      if (valueOrDefault<bool>(
              currentUserDocument?.isCompleteRegistration, false) ==
          false) {
        context.goNamed(
          'profilePage',
          queryParameters: {
            'isEditMode': serializeParam(
              true,
              ParamType.bool,
            ),
          }.withoutNulls,
        );

        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Information'),
              content: const Text('Enregistrement incomplet'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Finaliser.'),
                ),
              ],
            );
          },
        );
        // LOG
        await actions.logAction(
          'dashboard :  onload false complete registration : ${valueOrDefault<bool>(currentUserDocument?.isCompleteRegistration, false).toString()}',
        );
      } else {
        // LOG
        await actions.logAction(
          'dashboard :    Navigation et enrtegistrement  OK',
        );
        _model.isCollectionMessage = await actions.doesCollectionExist(
          'message',
        );
        if (_model.isCollectionMessage!) {
          // Nombre notifications
          _model.nombreNotifications = await queryMessageRecordCount(
            queryBuilder: (messageRecord) => messageRecord
                .where(
                  'phone_receiver',
                  isEqualTo: currentPhoneNumber,
                )
                .where(
                  'status',
                  isEqualTo: FFAppConstants.listeStatus
                      .elementAtOrNull(FFAppConstants.indiceEnAttente),
                ),
          );
          _model.isNotification =
              _model.nombreNotifications! > 0 ? true : false;
          safeSetState(() {});
        } else {
          _model.isNotification = false;
          safeSetState(() {});
        }
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: wrapWithModel(
                  model: _model.kilianAppBarAccueilModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const KilianAppBarAccueilWidget(),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tableau de bord',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            if (widget.isGetStared)
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('defaultPage');
                                },
                                text: 'Presentation kilian',
                                icon: const Icon(
                                  Icons.double_arrow_rounded,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: 170.0,
                                  height: 35.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 4.0, 0.0),
                                  iconAlignment: IconAlignment.end,
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Mukta',
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (currentUserPhoto != '')
                                  AuthUserStreamWidget(
                                    builder: (context) => ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        currentUserPhoto != ''
                                            ? currentUserPhoto
                                            : '',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          width: 25.0,
                                          height: 25.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                Container(
                                  width: 200.0,
                                  decoration: const BoxDecoration(),
                                  child: Wrap(
                                    spacing: 0.0,
                                    runSpacing: 1.0,
                                    alignment: WrapAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.antiAlias,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => AutoSizeText(
                                            '${valueOrDefault(currentUserDocument?.genre, '')} $currentUserDisplayName'
                                                .maybeHandleOverflow(
                                              maxChars: 70,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            minFontSize: 12.0,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (_model.isNotification ?? true)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.notification_add,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 15.0,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => FutureBuilder<int>(
                                        future: queryMessageRecordCount(
                                          queryBuilder: (messageRecord) =>
                                              messageRecord
                                                  .where(
                                                    'phone_receiver',
                                                    isEqualTo:
                                                        currentPhoneNumber,
                                                  )
                                                  .where(
                                                    'status',
                                                    isEqualTo: FFAppConstants
                                                        .listeStatus
                                                        .elementAtOrNull(
                                                            FFAppConstants
                                                                .indiceEnAttente),
                                                  ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          int badgeCount = snapshot.data!;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              // GO TO MES CONTRAT

                                              context.pushNamed('mesContrats');
                                            },
                                            child: badges.Badge(
                                              badgeContent: Text(
                                                badgeCount.toString(),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              showBadge: true,
                                              shape: badges.BadgeShape.circle,
                                              badgeColor: const Color(0xFFFF0707),
                                              elevation: 4.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 5.0),
                                              position: badges.BadgePosition
                                                  .topStart(),
                                              animationType: badges
                                                  .BadgeAnimationType.scale,
                                              toAnimate: true,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ].divide(const SizedBox(width: 10.0)),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('mesContrats');
                          },
                          text: 'Historique des contrats',
                          icon: Icon(
                            Icons.history,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Séléctionner le type de contrat que vous souhaiter générer : ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FlutterFlowChoiceChips(
                                                options: [
                                                  ChipData(
                                                      FFAppConstants
                                                          .listeTypeContrat
                                                          .elementAtOrNull(
                                                              FFAppConstants
                                                                  .indiceAdulte)!,
                                                      FontAwesomeIcons
                                                          .userSecret),
                                                  ChipData(
                                                      FFAppConstants
                                                          .listeTypeContrat
                                                          .elementAtOrNull(
                                                              FFAppConstants
                                                                  .indiceVente)!,
                                                      FontAwesomeIcons
                                                          .moneyCheckAlt),
                                                  ChipData(
                                                      FFAppConstants
                                                          .listeTypeContrat
                                                          .elementAtOrNull(
                                                              FFAppConstants
                                                                  .indiceCessation)!,
                                                      FontAwesomeIcons.gift)
                                                ],
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .typeContratSelectedValue =
                                                        val?.firstOrNull),
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily: 'Mukta',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 2.0,
                                                          ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  iconSize: 20.0,
                                                  labelPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(2.0, 0.0,
                                                              2.0, 0.0),
                                                  elevation: 20.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  borderWidth: 2.0,
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily: 'Mukta',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  iconSize: 20.0,
                                                  labelPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(2.0, 0.0,
                                                              2.0, 0.0),
                                                  elevation: 0.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  borderWidth: 1.0,
                                                ),
                                                chipSpacing: 8.0,
                                                rowSpacing: 18.0,
                                                multiselect: false,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .typeContratSelectedValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [],
                                                ),
                                                wrapped: true,
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed:
                                                  (_model.typeContratSelectedValue ==
                                                              null ||
                                                          _model.typeContratSelectedValue ==
                                                              '')
                                                      ? null
                                                      : () async {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                _model
                                                                    .typeContratSelectedValue!,
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      5000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                          if (_model
                                                                  .typeContratSelectedValue ==
                                                              FFAppConstants
                                                                  .listeTypeContrat
                                                                  .elementAtOrNull(
                                                                      FFAppConstants
                                                                          .indiceAdulte)) {
                                                            // Adulte

                                                            context.pushNamed(
                                                                'generationAdultContract');
                                                          } else if (_model
                                                                  .typeContratSelectedValue ==
                                                              FFAppConstants
                                                                  .listeTypeContrat
                                                                  .elementAtOrNull(
                                                                      FFAppConstants
                                                                          .indiceVente)) {
                                                            // Vente

                                                            context.pushNamed(
                                                                'generationVenteContract');
                                                          } else if (_model
                                                                  .typeContratSelectedValue ==
                                                              FFAppConstants
                                                                  .listeTypeContrat
                                                                  .elementAtOrNull(
                                                                      FFAppConstants
                                                                          .indiceCessation)) {
                                                            context.pushNamed(
                                                                'generationCessationContract');
                                                          } else {
                                                            // Cas  inconnu
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Erreur'),
                                                                  content: Text(
                                                                      'Cas inconnu : ${_model.typeContratSelectedValue}'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Continuer'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                              text: 'Continuer',
                                              icon: const Icon(
                                                Icons.build,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 45.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 16.0)),
                                        ),
                                      ].divide(const SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 15.0))
                          .addToStart(const SizedBox(height: 10.0)),
                    ),
                  ),
                ].divide(const SizedBox(height: 2.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
