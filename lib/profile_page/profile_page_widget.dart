import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/my_signature/my_signature_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({
    super.key,
    bool? isEditMode,
  }) : isEditMode = isEditMode ?? true;

  final bool isEditMode;

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // LOG
      await actions.logAction(
        'profile  : onload :${valueOrDefault<bool>(currentUserDocument?.isCompleteRegistration, false).toString()}',
      );
      if (valueOrDefault<bool>(
              currentUserDocument?.isCompleteRegistration, false) !=
          false) {
        await actions.mySetOpposedBool(
          valueOrDefault<bool>(
              currentUserDocument?.isCompleteRegistration, false),
          widget.isEditMode,
        );
        // LOG
        await actions.logAction(
          'profile  : onload 2 inverse:${valueOrDefault<bool>(currentUserDocument?.isCompleteRegistration, false).toString()}',
        );
      }
    });

    _model.nameTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.name, ''));
    _model.nameFocusNode ??= FocusNode();

    _model.nicknameTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.nickname, ''));
    _model.nicknameFocusNode ??= FocusNode();

    _model.adressTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.adress, ''));
    _model.adressFocusNode ??= FocusNode();

    _model.phoneNumberTextController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.phoneNumberFocusNode ??= FocusNode();

    _model.birthdayTextController ??= TextEditingController(
        text: functions.myStringFromDate(currentUserDocument?.birthday));
    _model.birthdayFocusNode ??= FocusNode();

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
              if (valueOrDefault<bool>(
                      currentUserDocument?.isCompleteRegistration, false) ==
                  true) {
                context.safePop();
              } else {
                context.goNamed('login');

                await authManager.deleteUser(context);
              }
            },
          ),
          title: Align(
            alignment: const AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 0.0),
              child: Text(
                'KILIAN',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!valueOrDefault<bool>(
                                currentUserDocument?.isCompleteRegistration,
                                false))
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  'Finaliser votre profil',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.isCompleteRegistration,
                                    false) ==
                                true)
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('Consulter'),
                                        ChipData('Editer')
                                      ],
                                      onChanged: (val) async {
                                        safeSetState(() =>
                                            _model.choiceReadOrWriteValue =
                                                val?.firstOrNull);
                                        if (_model.choiceReadOrWriteValue ==
                                            'Editer') {
                                          context.goNamed(
                                            'profilePage',
                                            queryParameters: {
                                              'isEditMode': serializeParam(
                                                true,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          context.goNamed(
                                            'profilePage',
                                            queryParameters: {
                                              'isEditMode': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mukta',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        iconSize: 16.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mukta',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        iconSize: 16.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      chipSpacing: 8.0,
                                      rowSpacing: 8.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceReadOrWriteValue != null,
                                      alignment: WrapAlignment.start,
                                      controller: _model
                                              .choiceReadOrWriteValueController ??=
                                          FormFieldController<List<String>>(
                                        ['Consulter'],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => FlutterFlowDropDown<String>(
                              controller:
                                  _model.selectorGenreValueController ??=
                                      FormFieldController<String>(
                                _model.selectorGenreValue ??= valueOrDefault(
                                    currentUserDocument?.genre, ''),
                              ),
                              options: const ['M.', 'Me.'],
                              onChanged: (val) => safeSetState(
                                  () => _model.selectorGenreValue = val),
                              width: 70.0,
                              height: 45.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mukta',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.0,
                                  ),
                              hintText: 'M.',
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context).primary,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 0.0,
                              borderRadius: 4.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          Expanded(
                            child: AuthUserStreamWidget(
                              builder: (context) => SizedBox(
                                width: 200.0,
                                child: TextFormField(
                                  controller: _model.nameTextController,
                                  focusNode: _model.nameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nameTextController',
                                    const Duration(milliseconds: 500),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.next,
                                  readOnly: widget.isEditMode == false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nom',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Mukta',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 0.5,
                                        ),
                                    hintText: valueOrDefault(
                                        currentUserDocument?.name, ''),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Mukta',
                                          color: FlutterFlowTheme.of(context)
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
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).tertiary,
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
                                  keyboardType: TextInputType.name,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.nameTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AuthUserStreamWidget(
                              builder: (context) => SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.nicknameTextController,
                                  focusNode: _model.nicknameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nicknameTextController',
                                    const Duration(milliseconds: 500),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.next,
                                  readOnly: widget.isEditMode == false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Prenom',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Mukta',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 0.5,
                                        ),
                                    hintText: valueOrDefault(
                                        currentUserDocument?.nickname, ''),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Mukta',
                                          color: FlutterFlowTheme.of(context)
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
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).tertiary,
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
                                        letterSpacing: 0.0,
                                        lineHeight: 0.5,
                                      ),
                                  keyboardType: TextInputType.name,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .nicknameTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 5.0)),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.adressTextController,
                            focusNode: _model.adressFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.adressTextController',
                              const Duration(milliseconds: 500),
                              () async {
                                _model.listSuggested =
                                    await actions.getAddressSuggestions(
                                  _model.adressTextController.text,
                                  'AIzaSyCFJ6RGt08LpY1YhkiBtRZFgWreWasaUPE',
                                );
                                _model.addressSuggestions = _model
                                    .listSuggested!
                                    .toList()
                                    .cast<String>();
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            readOnly: widget.isEditMode == false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Adresse',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Mukta',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 0.5,
                                  ),
                              hintText: valueOrDefault(
                                  currentUserDocument?.adress, ''),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Mukta',
                                    color: const Color(0xFF606A85),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 0.5,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).tertiary,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mukta',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  lineHeight: 0.5,
                                ),
                            keyboardType: TextInputType.streetAddress,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.adressTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      if (((_model.addressSuggestions.isNotEmpty) == true) &&
                          (_model.adressFocusNode?.hasFocus ?? false))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 1.0),
                          child: Builder(
                            builder: (context) {
                              final itemAdress = _model.addressSuggestions
                                  .toList()
                                  .take(4)
                                  .toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: itemAdress.length,
                                itemBuilder: (context, itemAdressIndex) {
                                  final itemAdressItem =
                                      itemAdress[itemAdressIndex];
                                  return Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    child: Container(
                                      width: 250.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          width: 1.0,
                                        ),
                                      ),
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flex(
                                            direction: Axis.horizontal,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    // update field adress
                                                    safeSetState(() {
                                                      _model.adressTextController
                                                              ?.text =
                                                          itemAdressItem;
                                                    });
                                                  },
                                                  child: AutoSizeText(
                                                    itemAdressItem
                                                        .maybeHandleOverflow(
                                                      maxChars: 50,
                                                    ),
                                                    minFontSize: 10.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mukta',
                                                          letterSpacing: 0.0,
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
                                },
                              );
                            },
                          ),
                        ),
                      AuthUserStreamWidget(
                        builder: (context) => SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.phoneNumberTextController,
                            focusNode: _model.phoneNumberFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.phoneNumberTextController',
                              const Duration(milliseconds: 500),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            readOnly: widget.isEditMode == false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Téléphone (10 chiffres)',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Mukta',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 0.5,
                                  ),
                              hintText: currentPhoneNumber,
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Mukta',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 0.5,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).tertiary,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 20.0, 24.0),
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mukta',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  lineHeight: 0.5,
                                ),
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            keyboardType: TextInputType.phone,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.phoneNumberTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.phoneNumberMask],
                          ),
                        ),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.birthdayTextController,
                            focusNode: _model.birthdayFocusNode,
                            autofocus: false,
                            textCapitalization: TextCapitalization.none,
                            readOnly: widget.isEditMode == false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Date de naissance (jj/mm/aaaa)',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Mukta',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 0.5,
                                  ),
                              hintText: dateTimeFormat(
                                "d/M/y",
                                currentUserDocument?.birthday,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Mukta',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 0.5,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).tertiary,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mukta',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  lineHeight: 0.5,
                                ),
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            keyboardType: TextInputType.datetime,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.birthdayTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.birthdayMask],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Signature',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Mukta',
                                  color: const Color(0xFF606A85),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (widget.isEditMode == true) {
                                      await showAlignedDialog(
                                        context: context,
                                        isGlobal: false,
                                        avoidOverflow: false,
                                        targetAnchor:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            const AlignmentDirectional(0.0, -1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(dialogContext)
                                                      .unfocus(),
                                              child: const MySignatureWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        valueOrDefault(
                                            currentUserDocument?.signature, ''),
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kilian-h9p44p/assets/w2lchkl2fid2/chatgpt_signature.png',
                                      ),
                                      width: 210.0,
                                      height: 140.0,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: 210.0,
                                        height: 140.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(height: 8.0)),
                  ),
                ),
                if ((widget.isEditMode == true) ||
                    !valueOrDefault<bool>(
                        currentUserDocument?.isCompleteRegistration, false))
                  AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        if ((_model.nameTextController.text != '') &&
                            (_model.nicknameTextController.text != '') &&
                            (_model.adressTextController.text != '') &&
                            (_model.phoneNumberTextController.text != '') &&
                            (_model.birthdayTextController.text != '') &&
                            (valueOrDefault(
                                        currentUserDocument?.signature, '') !=
                                    '')) {
                          _model.listAlreadyReccorded =
                              await queryUsersRecordOnce(
                            queryBuilder: (usersRecord) => usersRecord
                                .where(
                                  'phone_number',
                                  isEqualTo:
                                      _model.phoneNumberTextController.text,
                                )
                                .where(
                                  'phone_number',
                                  isNotEqualTo: currentPhoneNumber,
                                ),
                          );
                          if (_model.listAlreadyReccorded?.length.toString() ==
                              '0') {
                            // info notification
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Notifications'),
                                  content: const Text(
                                      'Cette application utilise les notifications pour communiquer avec les autres utilisateurs.'),
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
                            _model.notificationGranted = await actions
                                .requestNotificationPermissionForUser();
                            if (!_model.notificationGranted!) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Notification'),
                                    content: const Text('Autorisation impossible!'),
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
                            // update user

                            await currentUserReference!
                                .update(createUsersRecordData(
                              genre: _model.selectorGenreValue,
                              nickname: _model.nicknameTextController.text,
                              displayName: functions.displayName(
                                  _model.nameTextController.text,
                                  _model.nicknameTextController.text),
                              name: _model.nameTextController.text,
                              adress: _model.adressTextController.text,
                              birthday: functions.myParseDateFromString(
                                  _model.birthdayTextController.text),
                              phoneNumber:
                                  _model.phoneNumberTextController.text,
                              online: true,
                              isCompleteRegistration: true,
                            ));
                            await actions.logAction(
                              valueOrDefault<bool>(
                                      currentUserDocument
                                          ?.isCompleteRegistration,
                                      false)
                                  .toString(),
                            );
                            // go to dashboard

                            context.goNamed('dashboard');

                            await actions.logAction(
                              valueOrDefault<bool>(
                                      currentUserDocument
                                          ?.isCompleteRegistration,
                                      false)
                                  .toString(),
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Opération échoué'),
                                  content: Text(
                                      'Le numéro : ${_model.phoneNumberTextController.text} est déjà utilisé'),
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
                          }
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Formulaire incorrect'),
                                content: const Text(
                                    'Tous les champs doivent être renseignées correctement !'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Recommencer'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Enregistrer',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              lineHeight: 0.5,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
              ].divide(const SizedBox(height: 0.0)).addToStart(const SizedBox(height: 5.0)),
            ),
          ),
        ),
      ),
    );
  }
}
