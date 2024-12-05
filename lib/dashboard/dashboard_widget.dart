import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  ///  complete with a button:
  /// named "historic",
  /// label "Historique des contrat",
  /// background color : black
  /// text color : white
  /// radius corner:  8
  ///
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

        // LOG
        await actions.logAction(
          'dashboard :  onload false complete registration : ${valueOrDefault<bool>(currentUserDocument?.isCompleteRegistration, false).toString()}',
        );
      } else {
        // LOG
        await actions.logAction(
          'dashboard :  onload init :${valueOrDefault<bool>(currentUserDocument?.isCompleteRegistration, false).toString()}NO FURTHER NAVIGATION REQUIRED',
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 1.0, 0.0),
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
          actions: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 4.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  hoverColor: FlutterFlowTheme.of(context).primary,
                  hoverIconColor: FlutterFlowTheme.of(context).alternate,
                  icon: Icon(
                    Icons.login_outlined,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('login', context.mounted);
                  },
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
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
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/notification.png',
                            width: 25.0,
                            height: 25.0,
                            fit: BoxFit.cover,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                showBadge: true,
                                shape: badges.BadgeShape.circle,
                                badgeColor: const Color(0xFFFF0707),
                                elevation: 4.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 5.0),
                                position: badges.BadgePosition.topStart(),
                                animationType: badges.BadgeAnimationType.scale,
                                toAnimate: true,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('notifications');
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                        color: FlutterFlowTheme.of(context).primaryBackground,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowChoiceChips(
                                            options: const [
                                              ChipData(
                                                  'Contrat de consentement entre adulte',
                                                  FontAwesomeIcons.userSecret),
                                              ChipData(
                                                  'Contrat de vente entre particulier',
                                                  FontAwesomeIcons
                                                      .moneyCheckAlt),
                                              ChipData(
                                                  'Contrat de cessation entre particulier',
                                                  FontAwesomeIcons.gift)
                                            ],
                                            onChanged: (val) => safeSetState(() =>
                                                _model.typeContratSelectedValue =
                                                    val?.firstOrNull),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Mukta',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 2.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              iconSize: 20.0,
                                              labelPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                              elevation: 20.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderWidth: 2.0,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Mukta',
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              iconSize: 20.0,
                                              labelPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                              elevation: 0.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
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
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
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
                                                          'Contrat de consentement entre adulte') {
                                                        context.pushNamed(
                                                            'generationAdultContract');
                                                      } else {
                                                        if (_model
                                                                .typeContratSelectedValue ==
                                                            '') {
                                                          context.pushNamed(
                                                              'defaultPage');
                                                        } else {
                                                          context.pushNamed(
                                                              'defaultPage');
                                                        }
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            disabledColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
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
              FFButtonWidget(
                onPressed: () async {
                  FFAppState().phoneNumberTo = '0652408309';
                  FFAppState().smsFrom = 'M. Thierry RICHOL';
                  FFAppState().smsTo = 'gggggggg';
                  safeSetState(() {});
                  await action_blocks.sendInvitation(context);
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
