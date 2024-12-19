import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/kilian_app_bar/kilian_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'generation_adult_contract_model.dart';
export 'generation_adult_contract_model.dart';

class GenerationAdultContractWidget extends StatefulWidget {
  const GenerationAdultContractWidget({super.key});

  @override
  State<GenerationAdultContractWidget> createState() =>
      _GenerationAdultContractWidgetState();
}

class _GenerationAdultContractWidgetState
    extends State<GenerationAdultContractWidget> {
  late GenerationAdultContractModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerationAdultContractModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // RESET LISTE PHONE
      _model.listPhoneContractantValide = [];
      _model.isBuildAction = false;
      safeSetState(() {});
      // SET IN LIST USER PHONE
      _model.addToListPhoneContractantValide(currentPhoneNumber);
      safeSetState(() {});
    });

    _model.horaireRendezVousTextController ??= TextEditingController();
    _model.horaireRendezVousFocusNode ??= FocusNode();

    _model.currentPhoneTxtTextController ??= TextEditingController();
    _model.currentPhoneTxtFocusNode ??= FocusNode();

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
                  model: _model.kilianAppBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const KilianAppBarWidget(),
                ),
              ),
              Builder(
                builder: (context) {
                  if (!_model.isBuildAction) {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Pratiques à contractualiser : ',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                            Container(
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
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowCheckboxGroup(
                                options: functions
                                    .orderedObjetContrat(FFAppState()
                                        .cListObjetContratAdulte
                                        .toList())!
                                    .map((e) => e.titre)
                                    .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.checkboxGroupValues = val),
                                controller:
                                    _model.checkboxGroupValueController ??=
                                        FormFieldController<List<String>>(
                                  [],
                                ),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                checkboxBorderColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mukta',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                unselectedTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mukta',
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                        ),
                                checkboxBorderRadius:
                                    BorderRadius.circular(5.0),
                                initialized: _model.checkboxGroupValues != null,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model
                                          .horaireRendezVousTextController,
                                      focusNode:
                                          _model.horaireRendezVousFocusNode,
                                      autofocus: false,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Horaire du rendez-vous  (jj/mm/aaaa Heure)',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Mukta',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              lineHeight: 0.5,
                                            ),
                                        hintText: 'JJ/MM/AAAA hh:min',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Mukta',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              lineHeight: 0.5,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mukta',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            lineHeight: 0.5,
                                          ),
                                      maxLength: 16,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      keyboardType: TextInputType.datetime,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .horaireRendezVousTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        _model.horaireRendezVousMask
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Numéro de téléphone des contractants : ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Mukta',
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller:
                                          _model.currentPhoneTxtTextController,
                                      focusNode:
                                          _model.currentPhoneTxtFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Mukta',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              lineHeight: 0.5,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Mukta',
                                              letterSpacing: 0.0,
                                              lineHeight: 0.5,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mukta',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            lineHeight: 0.5,
                                          ),
                                      maxLength: 10,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .currentPhoneTxtTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        _model.currentPhoneTxtMask
                                      ],
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.contact_phone,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    await actions.logAction(
                                      'APPEL LISTE CONTACT',
                                    );
                                    // get list phone number and set
                                    _model.selectedPhoneNumber =
                                        await actions.pickPhoneNumber();
                                    if (_model.selectedPhoneNumber == '!!!!!') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text(
                                                'L\'application n\'a pas accès à votre liste de contacts.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Continuer'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else if (_model.selectedPhoneNumber ==
                                        '#####') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Votre liste de contacts est vide!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Continuer'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else if (_model.selectedPhoneNumber ==
                                        '-----') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text(
                                                'L\'application n\'a pas accès aux contacts'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Continuer'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    // update text field
                                    _model.phoneNumberController =
                                        _model.selectedPhoneNumber;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    if (_model.currentPhoneTxtTextController
                                            .text !=
                                        currentPhoneNumber) {
                                      _model.userByPhoneFoundList =
                                          await queryUsersRecordOnce(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'phone_number',
                                          isEqualTo: _model
                                              .currentPhoneTxtTextController
                                              .text,
                                        ),
                                      );
                                      if (_model.userByPhoneFoundList?.length
                                              .toString() ==
                                          '1') {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Opération réussie!'),
                                              content: Text(
                                                  'Contractant : ${_model.userByPhoneFoundList?.firstOrNull?.displayName}(${_model.userByPhoneFoundList?.firstOrNull?.phoneNumber}).....  trouvé!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
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
                                              title: const Text('Note informative'),
                                              content: Text(
                                                  'Le numéro ${_model.currentPhoneTxtTextController.text}, ne correspond à aucun utlisateur(trice) connécté à l\'application KILIAN. Cependant, vous pouvez poursuivre, un SMS sera envoyé à ce numéro indiquant à son  propriétaire la démarche à suivre.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Continuer'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }

                                      if (_model.listPhoneContractantValide
                                              .contains(_model
                                                  .currentPhoneTxtTextController
                                                  .text) ==
                                          false) {
                                        _model.addToListPhoneContractantValide(
                                            _model.currentPhoneTxtTextController
                                                .text);
                                        safeSetState(() {});
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Opération impossible'),
                                              content: Text(
                                                  '${_model.currentPhoneTxtTextController.text}... a déja été renseigné!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Annuler'),
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
                                            title: const Text('Opération impossible'),
                                            content: Text(
                                                '${_model.currentPhoneTxtTextController.text}... correspond à votre propre numéro'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text(
                                                    'Choisir un autre numéro'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    // Nettoyage nettoyage champ phone
                                    safeSetState(() {
                                      _model.currentPhoneTxtTextController
                                          ?.text = '';
                                      _model.currentPhoneTxtMask.updateMask(
                                        newValue: TextEditingValue(
                                          text: _model
                                              .currentPhoneTxtTextController!
                                              .text,
                                        ),
                                      );
                                    });

                                    safeSetState(() {});
                                  },
                                ),
                              ]
                                  .divide(const SizedBox(width: 3.0))
                                  .addToEnd(const SizedBox(width: 3.0)),
                            ),
                            if (_model.listPhoneContractantValide.isNotEmpty)
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Builder(
                                    builder: (context) {
                                      final itemPhoneContractantValide = _model
                                          .listPhoneContractantValide
                                          .toList()
                                          .take(4)
                                          .toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            itemPhoneContractantValide.length,
                                        itemBuilder: (context,
                                            itemPhoneContractantValideIndex) {
                                          final itemPhoneContractantValideItem =
                                              itemPhoneContractantValide[
                                                  itemPhoneContractantValideIndex];
                                          return Visibility(
                                            visible:
                                                itemPhoneContractantValideItem !=
                                                    currentPhoneNumber,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Container(
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Text(
                                                            itemPhoneContractantValideItem,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mukta',
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              borderRadius: 4.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .eye,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 15.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                _model.itemPhoneCur =
                                                                    await queryUsersRecordOnce(
                                                                  queryBuilder:
                                                                      (usersRecord) =>
                                                                          usersRecord
                                                                              .where(
                                                                    'phone_number',
                                                                    isEqualTo:
                                                                        itemPhoneContractantValideItem,
                                                                  ),
                                                                );
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'Information'),
                                                                      content: Text(_model
                                                                          .itemPhoneCur!
                                                                          .firstOrNull!
                                                                          .displayName),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child:
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
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .trashAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 15.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model.removeFromListPhoneContractantValide(
                                                                      itemPhoneContractantValideItem);
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(const SizedBox(
                                                                  width: 3.0))
                                                              .addToEnd(
                                                                  const SizedBox(
                                                                      width:
                                                                          2.0)),
                                                        ),
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
                              ),
                            if (_model.listPhoneContractantValide.length > 1)
                              FFButtonWidget(
                                onPressed: () async {
                                  // LOG APPEL ACTION
                                  await actions.logAction(
                                    'Appel btn generation contrat',
                                  );
                                  if (_model.checkboxGroupValues?.length == 0) {
                                    // Formulaire incomplet
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Formulaire incomplet'),
                                          content: const Text(
                                              'Vous devez séléctioner une pratique.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    _model.isBuildAction = true;
                                    safeSetState(() {});
                                    // clean page state variable
                                    _model.listObjetContrat = [];
                                    _model.listContractants = [];
                                    // LOG APPEL ACTION
                                    await actions.logAction(
                                      'Appel clean data contrat',
                                    );
                                    // CLEAN contratData
                                    FFAppState().contratDataAppState =
                                        ContratDataStruct();
                                    safeSetState(() {});
                                    // Pretraitement contratData
                                    FFAppState()
                                        .updateContratDataAppStateStruct(
                                      (e) => e
                                        ..allContractantsRegistered = true
                                        ..uid = random_data.randomString(
                                          18,
                                          19,
                                          true,
                                          true,
                                          true,
                                        ),
                                    );
                                    // CONTRATDATA TO DOCUMENT

                                    var contratsRecordReference = ContratsRecord
                                        .collection
                                        .doc(FFAppState()
                                            .contratDataAppState
                                            .uid);
                                    await contratsRecordReference
                                        .set(createContratsRecordData(
                                      contratData: updateContratDataStruct(
                                        FFAppState().contratDataAppState,
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                    ));
                                    _model.contratDataDoc =
                                        ContratsRecord.getDocumentFromData(
                                            createContratsRecordData(
                                              contratData:
                                                  updateContratDataStruct(
                                                FFAppState()
                                                    .contratDataAppState,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                            ),
                                            contratsRecordReference);
                                    // reset loop increment
                                    FFAppState().iLoop = 0;
                                    FFAppState().indiceTypeContratAppState =
                                        FFAppConstants.indiceAdulte;
                                    while (FFAppState().iLoop <
                                        _model.checkboxGroupValues!.length) {
                                      // create objetContrat
                                      _model.addToListObjetContrat(
                                          ObjetContratStruct(
                                        titre: _model.checkboxGroupValues
                                            ?.elementAtOrNull(
                                                FFAppState().iLoop),
                                        categorie: 'adulte',
                                      ));
                                      // increment
                                      FFAppState().iLoop =
                                          FFAppState().iLoop + 1;
                                    }
                                    // reset loop increment
                                    FFAppState().iLoop = 0;
                                    while (FFAppState().iLoop <
                                        _model.listPhoneContractantValide
                                            .length) {
                                      // find contractant
                                      _model.currentUserContractantDoc =
                                          await queryUsersRecordOnce(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'phone_number',
                                          isEqualTo: _model
                                              .listPhoneContractantValide
                                              .elementAtOrNull(
                                                  FFAppState().iLoop),
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (!(_model.currentUserContractantDoc
                                              ?.reference !=
                                          null)) {
                                        // MISSING CONTRACTANT STATUS
                                        FFAppState()
                                            .updateContratDataAppStateStruct(
                                          (e) => e
                                            ..allContractantsRegistered = false,
                                        );
                                      }
                                      // CREATION CONTRACTANT
                                      _model.addToListContractants(
                                          ContractantDataStruct(
                                        nom: _model
                                            .currentUserContractantDoc?.name,
                                        prenom: _model.currentUserContractantDoc
                                            ?.nickname,
                                        phoneNumber: _model
                                            .listPhoneContractantValide
                                            .elementAtOrNull(
                                                FFAppState().iLoop),
                                        status: FFAppConstants.listeStatus
                                            .elementAtOrNull(0),
                                        uid: _model
                                            .currentUserContractantDoc?.uid,
                                        genre: _model
                                            .currentUserContractantDoc?.genre,
                                        signature: _model
                                            .currentUserContractantDoc
                                            ?.signature,
                                        estContratTelecharger: false,
                                      ));
                                      // increment
                                      FFAppState().iLoop =
                                          FFAppState().iLoop + 1;
                                    }
                                    // SET FIELD contratPDF
                                    FFAppState()
                                        .updateContratDataAppStateStruct(
                                      (e) => e
                                        ..contratPDF =
                                            '${FFAppConstants.repertoireContratsEnCours}${FFAppState().contratDataAppState.uid}.pdf',
                                    );
                                    // REMPLISSAGE CONTRATDATA
                                    FFAppState()
                                        .updateContratDataAppStateStruct(
                                      (e) => e
                                        ..title =
                                            '${FFAppConstants.listeLabelContrat.elementAtOrNull(0)} rédiger par $currentUserDisplayName le  ${functions.getCurrentDateTimeStr()}'
                                        ..type = FFAppConstants
                                            .listeLabelContrat
                                            .elementAtOrNull(
                                                FFAppConstants.indiceAdulte)
                                        ..dateCreation =
                                            functions.getCurrentDateTime()
                                        ..status = FFAppConstants.listeStatus
                                            .elementAtOrNull(FFAppState()
                                                .indiceStatusAppState)
                                        ..contractantsData =
                                            _model.listContractants.toList()
                                        ..objetsContrat =
                                            _model.listObjetContrat.toList()
                                        ..auteur = currentUserDisplayName
                                        ..location =
                                            '${currentUserDocument?.location.city}  ${currentUserDocument?.location.country}'
                                        ..modeleHtmlContrat = FFAppConstants
                                            .listeFichierContrat
                                            .elementAtOrNull(
                                                FFAppConstants.indiceAdulte)
                                        ..auteurId = currentUserUid
                                        ..horaireRendezVous = functions
                                            .myParseDateFromString(_model
                                                .horaireRendezVousTextController
                                                .text)
                                        ..isNotificationCreationSent = false
                                        ..nombreMessage =
                                            _model.listContractants.length,
                                    );
                                    // Call HTTP build PDF
                                    _model.resultBuidPDF =
                                        await actions.buildContratPDF(
                                      functions.fixImproperJson(FFAppState()
                                          .contratDataAppState
                                          .toMap()
                                          .toString()),
                                    );
                                    if (_model.resultBuidPDF == null ||
                                        _model.resultBuidPDF == '') {
                                      // Wait
                                      await Future.delayed(
                                          const Duration(milliseconds: 3000));
                                      // convert pdf location in URL
                                      _model.urlContratPDFEnAttente =
                                          await actions.getDownloadUrl(
                                        FFAppState()
                                            .contratDataAppState
                                            .contratPDF,
                                      );
                                      // UPDATE URL CONTRAT
                                      FFAppState()
                                          .updateContratDataAppStateStruct(
                                        (e) => e
                                          ..url =
                                              '${_model.urlContratPDFEnAttente}',
                                      );
                                      // UPDATE CONTRATDATA DOCUMENT

                                      await _model.contratDataDoc!.reference
                                          .update(createContratsRecordData(
                                        contratData: updateContratDataStruct(
                                          FFAppState().contratDataAppState,
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      // ADDING TO USER CONTRATDATA

                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'contrats': FieldValue.arrayUnion([
                                              _model.contratDataDoc?.reference
                                            ]),
                                          },
                                        ),
                                      });
                                      // Notifications
                                      await action_blocks
                                          .blockNotificationInvitationContratASigner(
                                              context);
                                      _model.isBuildAction = false;
                                      safeSetState(() {});
                                      // FIN OPERATION
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Operation terminée!'),
                                            content: const Text(
                                                'Le contrat a été généré avec succès.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Voir'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      // NAVIGATION

                                      context.pushNamed('successPageBuildPDF');
                                    } else {
                                      // Return resultat
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Création contrat impossible'),
                                            content:
                                                Text(_model.resultBuidPDF!),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('continuer'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      _model.isBuildAction = false;
                                      safeSetState(() {});
                                    }
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Générer le contrat',
                                icon: const Icon(
                                  Icons.build,
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .addToStart(const SizedBox(height: 10.0))
                              .addToEnd(const SizedBox(height: 10.0)),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 0.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Animation_-_1734414688819.gif',
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
