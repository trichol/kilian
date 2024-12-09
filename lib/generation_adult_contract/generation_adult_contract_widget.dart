import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).alternate,
              size: 20.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Kilian',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).alternate,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Pratiques à contractualiser : ',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
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
                child: StreamBuilder<List<ObjetContratRecord>>(
                  stream: queryObjetContratRecord(
                    queryBuilder: (objetContratRecord) => objetContratRecord
                        .where(
                          'categorie',
                          isEqualTo: 'adulte',
                        )
                        .orderBy('titre'),
                    limit: 10,
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
                    List<ObjetContratRecord>
                        checkboxGroupObjetContratRecordList = snapshot.data!;

                    return FlutterFlowCheckboxGroup(
                      options: checkboxGroupObjetContratRecordList
                          .map((e) => e.titre)
                          .toList(),
                      onChanged: (val) =>
                          safeSetState(() => _model.checkboxGroupValues = val),
                      controller: _model.checkboxGroupValueController ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).secondaryText,
                      checkboxBorderColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Mukta',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                      unselectedTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Mukta',
                                color: Colors.black,
                                letterSpacing: 0.0,
                              ),
                      checkboxBorderRadius: BorderRadius.circular(5.0),
                      initialized: _model.checkboxGroupValues != null,
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Numéro de téléphone des contractants : ',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
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
                        controller: _model.currentPhoneTxtTextController,
                        focusNode: _model.currentPhoneTxtFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Mukta',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                lineHeight: 0.5,
                              ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Mukta',
                                    letterSpacing: 0.0,
                                    lineHeight: 0.5,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).accent2,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).tertiary,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mukta',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              lineHeight: 0.5,
                            ),
                        maxLength: 10,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.currentPhoneTxtTextControllerValidator
                            .asValidator(context),
                        inputFormatters: [_model.currentPhoneTxtMask],
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
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
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Continuer'),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (_model.selectedPhoneNumber == '#####') {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Votre liste de contacts est vide!'),
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
                      } else if (_model.selectedPhoneNumber == '-----') {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text(
                                  'L\'application n\'a pas accès aux contacts'),
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
                        // update text field
                        _model.phoneNumberController =
                            _model.selectedPhoneNumber;
                        safeSetState(() {});
                      }

                      safeSetState(() {});
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).secondary,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.add_circle,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      if (_model.currentPhoneTxtTextController.text !=
                          currentPhoneNumber) {
                        _model.userByPhoneFoundList =
                            await queryUsersRecordOnce(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'phone_number',
                            isEqualTo:
                                _model.currentPhoneTxtTextController.text,
                          ),
                        );
                        if (_model.userByPhoneFoundList?.length.toString() ==
                            '1') {
                          if (_model.listPhoneContractantValide.contains(
                                  _model.currentPhoneTxtTextController.text) ==
                              false) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Opération réussie!'),
                                  content: Text(
                                      'Contractant : ${_model.userByPhoneFoundList?.first.displayName}(${_model.userByPhoneFoundList?.first.phoneNumber}).....  trouvé!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            _model.addToListPhoneContractantValide(
                                _model.currentPhoneTxtTextController.text);
                            safeSetState(() {});
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Opération impossible'),
                                  content: Text(
                                      '${_model.currentPhoneTxtTextController.text}... a déja été renseigné!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
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
                                    '${_model.currentPhoneTxtTextController.text}... ne correspond à aucun utlisateur de l\'application KILIAN!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Choisir un autre numéro'),
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
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Choisir un autre numéro'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      safeSetState(() {});
                    },
                  ),
                ].divide(const SizedBox(width: 3.0)).addToEnd(const SizedBox(width: 3.0)),
              ),
              if (_model.listPhoneContractantValide.isNotEmpty)
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                          itemCount: itemPhoneContractantValide.length,
                          itemBuilder:
                              (context, itemPhoneContractantValideIndex) {
                            final itemPhoneContractantValideItem =
                                itemPhoneContractantValide[
                                    itemPhoneContractantValideIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 5.0),
                              child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 4.0, 4.0, 4.0),
                                        child: Text(
                                          itemPhoneContractantValideItem,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mukta',
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            borderRadius: 4.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: FaIcon(
                                              FontAwesomeIcons.eye,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 15.0,
                                            ),
                                            onPressed: () async {
                                              _model.itemPhoneCur =
                                                  await queryUsersRecordOnce(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'phone_number',
                                                  isEqualTo:
                                                      itemPhoneContractantValideItem,
                                                ),
                                              );
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text('Information'),
                                                    content: Text(_model
                                                        .itemPhoneCur!
                                                        .first
                                                        .displayName),
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

                                              safeSetState(() {});
                                            },
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius: 4.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: FaIcon(
                                                FontAwesomeIcons.trashAlt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 15.0,
                                              ),
                                              onPressed: () async {
                                                _model.removeFromListPhoneContractantValide(
                                                    itemPhoneContractantValideItem);
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ]
                                            .divide(const SizedBox(width: 3.0))
                                            .addToEnd(const SizedBox(width: 2.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              if ((_model.listPhoneContractantValide.isNotEmpty) == true)
                FFButtonWidget(
                  onPressed: () async {
                    if (_model.checkboxGroupValues?.length == 0) {
                      // Formulaire incomplet
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Formulaire incomplet'),
                            content:
                                const Text('Vous devez séléctioner une pratique.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // clean page state variable
                      _model.listObjetContrat = [];
                      _model.listContractants = [];
                      safeSetState(() {});
                      // reset loop increment
                      FFAppState().iLoop = 0;
                      safeSetState(() {});
                      while (FFAppState().iLoop <
                          _model.listPhoneContractantValide.length) {
                        // create objetContrat
                        _model.addToListObjetContrat(ObjetContratStruct(
                          titre:
                              _model.checkboxGroupValues?[FFAppState().iLoop],
                          categorie: 'adulte',
                        ));
                        safeSetState(() {});
                        // increment
                        FFAppState().iLoop = FFAppState().iLoop + 1;
                        safeSetState(() {});
                      }
                      // reset loop increment
                      FFAppState().iLoop = 0;
                      safeSetState(() {});
                      while (FFAppState().iLoop <
                          _model.listPhoneContractantValide.length) {
                        // find contractant
                        _model.currentUserDoc = await queryUsersRecordOnce(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'phone_number',
                            isEqualTo: _model
                                .listPhoneContractantValide[FFAppState().iLoop],
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        // Add contractant
                        _model.addToListContractants(ContractantDataStruct(
                          nom: _model.currentUserDoc?.name,
                          prenom: _model.currentUserDoc?.nickname,
                          phoneNumber: _model.currentUserDoc?.phoneNumber,
                          status: 'En attente',
                        ));
                        safeSetState(() {});
                        // increment
                        FFAppState().iLoop = FFAppState().iLoop + 1;
                        safeSetState(() {});
                      }
                      // Add current user
                      _model.addToListContractants(ContractantDataStruct(
                        nom: valueOrDefault(currentUserDocument?.name, ''),
                        prenom:
                            valueOrDefault(currentUserDocument?.nickname, ''),
                      ));
                      safeSetState(() {});
                      // fill contratData
                      _model.updateContratDataStruct(
                        (e) => e
                          ..objetsContrat = _model.listObjetContrat.toList()
                          ..title =
                              'contrat consentement adulte ${dateTimeFormat(
                            "d/M/y",
                            getCurrentTimestamp,
                            locale: FFLocalizations.of(context).languageCode,
                          )}'
                          ..type = 'adulte'
                          ..status = FFAppConstants.contratEnAttenteSignature
                          ..contractantsData = _model.listContractants.toList()
                          ..dateCreation = getCurrentTimestamp
                          ..auteur =
                              '${valueOrDefault(currentUserDocument?.genre, '')}$currentUserDisplayName'
                          ..location = currentUserDocument?.location.city
                          ..uid = random_data.randomString(
                            8,
                            9,
                            true,
                            true,
                            true,
                          )
                          ..modeleHtmlContrat =
                              'MODELE/modele_contrat_adulte.html'
                          ..contratPDF =
                              'users/$currentUserUid/contrats/adulte/en_cours/${random_data.randomString(
                            7,
                            8,
                            true,
                            true,
                            true,
                          )}.pdf'
                          ..auteurId = currentUserUid,
                      );
                      safeSetState(() {});
                      // fill postedContratData
                      _model.updatePostedContratDataStruct(
                        (e) => e
                          ..modeleHtmlContrat =
                              _model.contratData?.modeleHtmlContrat
                          ..contratPDF = _model.contratData?.contratPDF
                          ..contratData = _model.contratData,
                      );
                      safeSetState(() {});
                      // Call HTTP build PDF
                      _model.resultBuidPDF =
                          await actions.callPostedContratFunction(
                        _model.postedContratData?.modeleHtmlContrat,
                        _model.postedContratData?.contratPDF,
                        functions.fixImproperJson(
                            (_model.postedContratData?.contratData.toMap())
                                ?.toString()),
                      );
                      // Return resultat
                      _model.resultat = _model.resultBuidPDF;
                      safeSetState(() {});
                      if (_model.resultat == null || _model.resultat == '') {
                        // continuer
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Contrat '),
                                  content: const Text(
                                      'Le contrat a été généré. Voulez-vous continuer?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: const Text('Annuler'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: const Text('Continuer'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          // convert pdf location in URL
                          _model.urlContratPDFDraft =
                              await actions.getDownloadUrl(
                            _model.postedContratData?.contratPDF,
                          );
                          // set URL PDF to postedContratdata
                          _model.updatePostedContratDataStruct(
                            (e) => e
                              ..updateContratData(
                                (e) => e..url = '${_model.urlContratPDFDraft}',
                              ),
                          );
                          safeSetState(() {});
                          // set contrat data for doc user

                          var contratsRecordReference =
                              ContratsRecord.collection.doc();
                          await contratsRecordReference
                              .set(createContratsRecordData(
                            contratData: updateContratDataStruct(
                              _model.contratData,
                              clearUnsetFields: false,
                              create: true,
                            ),
                          ));
                          _model.contratDataForDocUser =
                              ContratsRecord.getDocumentFromData(
                                  createContratsRecordData(
                                    contratData: updateContratDataStruct(
                                      _model.contratData,
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                  ),
                                  contratsRecordReference);
                          // Dialog end operation
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Operation terminée!'),
                                content: const Text('Le contrat a été construit.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Voir'),
                                  ),
                                ],
                              );
                            },
                          );

                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'contrats': FieldValue.arrayUnion(
                                    [_model.contratDataForDocUser?.reference]),
                              },
                            ),
                          });

                          context.pushNamed(
                            'successPageBuildPDF',
                            queryParameters: {
                              'postedContrat': serializeParam(
                                _model.postedContratData,
                                ParamType.DataStruct,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          // Return resultat
                          _model.resultat = 'Opération annulée!';
                          safeSetState(() {});
                          _model.resultDeletionPDF =
                              await actions.callDeleteBucketFile(
                            _model.postedContratData?.contratPDF,
                          );
                          // Return resultat
                          _model.resultat = _model.resultDeletionPDF;
                          safeSetState(() {});
                        }
                      } else {
                        // Return resultat
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Création contrat impossible'),
                              content: const Text('L\'opération n\'a pas aboutie!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('continuer'),
                                ),
                              ],
                            );
                          },
                        );
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              if (_model.resultat != null && _model.resultat != '')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: 350.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).error,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      border: Border.all(
                        width: 1.0,
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 2.0, 20.0, 2.0),
                        child: Text(
                          valueOrDefault<String>(
                            _model.resultat,
                            'vide',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mukta',
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
            ]
                .divide(const SizedBox(height: 10.0))
                .addToStart(const SizedBox(height: 10.0))
                .addToEnd(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
