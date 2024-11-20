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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: FlutterFlowIconButton(
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
            ),
            title: Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Text(
                'KILIAN',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            actions: const [],
            centerTitle: false,
            toolbarHeight: 40.0,
            elevation: 0.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Pratiques à contractualiser : ',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: StreamBuilder<List<ObjetContratRecord>>(
                        stream: queryObjetContratRecord(
                          queryBuilder: (objetContratRecord) =>
                              objetContratRecord
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
                              checkboxGroupObjetContratRecordList =
                              snapshot.data!;

                          return FlutterFlowCheckboxGroup(
                            options: checkboxGroupObjetContratRecordList
                                .map((e) => e.titre)
                                .toList(),
                            onChanged: (val) => safeSetState(
                                () => _model.checkboxGroupValues = val),
                            controller: _model.checkboxGroupValueController ??=
                                FormFieldController<List<String>>(
                              [],
                            ),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                            checkboxBorderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            unselectedTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                ),
                            checkboxBorderRadius: BorderRadius.circular(8.0),
                            initialized: _model.checkboxGroupValues != null,
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Numéro de téléphone des contractants : ',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Inter',
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
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                ),
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            cursorColor: Colors.black,
                            validator: _model
                                .currentPhoneTxtTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.currentPhoneTxtMask],
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor: Colors.black,
                        icon: Icon(
                          Icons.add_circle,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
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
                            if (_model.userByPhoneFoundList?.length
                                    .toString() ==
                                '1') {
                              if (_model.listPhoneContractantValide.contains(
                                      _model.currentPhoneTxtTextController
                                          .text) ==
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
                    ]
                        .divide(const SizedBox(width: 3.0))
                        .addToEnd(const SizedBox(width: 3.0)),
                  ),
                ]
                    .divide(const SizedBox(height: 10.0))
                    .addToStart(const SizedBox(height: 10.0))
                    .addToEnd(const SizedBox(height: 10.0)),
              ),
            ),
            if (_model.listPhoneContractantValide.isNotEmpty)
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(6.0),
                                  bottomRight: Radius.circular(6.0),
                                  topLeft: Radius.circular(6.0),
                                  topRight: Radius.circular(6.0),
                                ),
                                border: Border.all(
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
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 4.0, 4.0, 4.0),
                                      child: Text(
                                        itemPhoneContractantValideItem,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
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
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor: Colors.black,
                                          icon: FaIcon(
                                            FontAwesomeIcons.eye,
                                            color: FlutterFlowTheme.of(context)
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
                                            borderColor: Colors.transparent,
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor: Colors.black,
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if ((_model.listPhoneContractantValide.isNotEmpty) == true)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
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
                              titre: _model
                                  .checkboxGroupValues?[FFAppState().iLoop],
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
                                isEqualTo: _model.listPhoneContractantValide[
                                    FFAppState().iLoop],
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
                            prenom: valueOrDefault(
                                currentUserDocument?.nickname, ''),
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
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}'
                              ..type = 'adulte'
                              ..status = 'en attente de signature'
                              ..contractantsData =
                                  _model.listContractants.toList()
                              ..dateCreation = getCurrentTimestamp
                              ..auteur =
                                  '${valueOrDefault(currentUserDocument?.genre, '')}$currentUserDisplayName'
                              ..location = currentUserDocument?.location.city,
                          );
                          safeSetState(() {});
                          // fill postedContratData
                          _model.updatePostedContratDataStruct(
                            (e) => e
                              ..modeleHtmlContrat =
                                  'MODELE/modele_contrat_adulte.html'
                              ..contratPDF =
                                  'users/$currentUserUid/contrats/adulte/en_cours/${random_data.randomString(
                                6,
                                8,
                                true,
                                true,
                                true,
                              )}.pdf'
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
                          if (_model.resultat == null ||
                              _model.resultat == '') {
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
                                    (e) =>
                                        e..url = '${_model.urlContratPDFDraft}',
                                  ),
                              );
                              safeSetState(() {});
                              // Dialog end operation
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Operation terminée!'),
                                    content:
                                        const Text('Le contrat a été construit.'),
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
                                  content:
                                      const Text('L\'opération n\'a pas aboutie!'),
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
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                if (_model.resultat != null && _model.resultat != '')
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
