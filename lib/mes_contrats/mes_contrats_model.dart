import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/kilian_app_bar/kilian_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'mes_contrats_widget.dart' show MesContratsWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class MesContratsModel extends FlutterFlowModel<MesContratsWidget> {
  ///  Local state fields for this page.

  List<ContratDataStruct> listeContratEnAttente = [];
  void addToListeContratEnAttente(ContratDataStruct item) =>
      listeContratEnAttente.add(item);
  void removeFromListeContratEnAttente(ContratDataStruct item) =>
      listeContratEnAttente.remove(item);
  void removeAtIndexFromListeContratEnAttente(int index) =>
      listeContratEnAttente.removeAt(index);
  void insertAtIndexInListeContratEnAttente(
          int index, ContratDataStruct item) =>
      listeContratEnAttente.insert(index, item);
  void updateListeContratEnAttenteAtIndex(
          int index, Function(ContratDataStruct) updateFn) =>
      listeContratEnAttente[index] = updateFn(listeContratEnAttente[index]);

  List<DataLabelValueStruct> listContratSigned = [];
  void addToListContratSigned(DataLabelValueStruct item) =>
      listContratSigned.add(item);
  void removeFromListContratSigned(DataLabelValueStruct item) =>
      listContratSigned.remove(item);
  void removeAtIndexFromListContratSigned(int index) =>
      listContratSigned.removeAt(index);
  void insertAtIndexInListContratSigned(int index, DataLabelValueStruct item) =>
      listContratSigned.insert(index, item);
  void updateListContratSignedAtIndex(
          int index, Function(DataLabelValueStruct) updateFn) =>
      listContratSigned[index] = updateFn(listContratSigned[index]);

  bool? isPageLoaded = true;

  ///  State fields for stateful widgets in this page.

  // Model for KilianAppBar component.
  late KilianAppBarModel kilianAppBarModel;

  @override
  void initState(BuildContext context) {
    kilianAppBarModel = createModel(context, () => KilianAppBarModel());
  }

  @override
  void dispose() {
    kilianAppBarModel.dispose();
  }

  /// Action blocks.
  Future gestionContratEnCours(BuildContext context) async {
    List<MessageRecord>? listeContratEnAttenteDoc;
    ContratsRecord? currentContratDoc;
    String? urlContratPDF;

    // contrats en attente pour moi
    listeContratEnAttenteDoc = await queryMessageRecordOnce(
      queryBuilder: (messageRecord) => messageRecord
          .where(
            'phone_receiver',
            isEqualTo: currentPhoneNumber,
          )
          .orderBy('datetime_sent'),
    );
    await actions.logAction(
      'Gestion contrat en cours...${listeContratEnAttenteDoc.length.toString()}',
    );
    // loop
    FFAppState().iLoop = 0;
    while (FFAppState().iLoop != listeContratEnAttenteDoc.length) {
      // get contrat DOC
      currentContratDoc = await queryContratsRecordOnce(
        queryBuilder: (contratsRecord) => contratsRecord.where(
          'contratData.uid',
          isEqualTo: listeContratEnAttenteDoc
              ?.elementAtOrNull(FFAppState().iLoop)
              ?.contratId
              ?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      await actions.logAction(
        'Contrat: ${currentContratDoc?.contratData.title}',
      );
      // Init ContratDataAppState
      FFAppState().contratDataAppState = currentContratDoc!.contratData;
      if (currentContratDoc.contratData.status ==
          FFAppConstants.listeStatus
              .elementAtOrNull(FFAppConstants.indiceSigne)) {
        if (!functions.isContratDownloadedByContractant(
            FFAppState().contratDataAppState, currentUserUid)!) {
          // contratPDF field to user location
          FFAppState().updateContratDataAppStateStruct(
            (e) => e
              ..contratPDF = 'users/$currentUserUid/contrats/${dateTimeFormat(
                "dMY",
                getCurrentTimestamp,
                locale: FFLocalizations.of(context).languageCode,
              )}_${functions.removePatternFromStr(FFAppState().contratDataAppState.type, 'contrat ')}_${FFAppState().contratDataAppState.uid}.pdf',
          );
          await actions.logAction(
            'le contrat  va etre telechargé vers : ${FFAppState().contratDataAppState.contratPDF}',
          );
          // build contrat for user
          await actions.buildContratPDF(
            functions.fixImproperJson(
                FFAppState().contratDataAppState.toMap().toString()),
          );
          await Future.delayed(const Duration(milliseconds: 2000));
          // build URL contratPDF
          urlContratPDF = await actions.getDownloadUrl(
            FFAppState().contratDataAppState.contratPDF,
          );
          // Update user with url

          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'url_contrats': FieldValue.arrayUnion([
                  getDataLabelValueFirestoreData(
                    createDataLabelValueStruct(
                      url: urlContratPDF,
                      value: FFAppState().contratDataAppState.contratPDF,
                      label: FFAppState().contratDataAppState.title,
                      clearUnsetFields: false,
                    ),
                    true,
                  )
                ]),
              },
            ),
          });
          // contratAppState re-init contratPDF
          FFAppState().updateContratDataAppStateStruct(
            (e) => e
              ..contratPDF =
                  'TMP/contrats/${FFAppState().contratDataAppState.uid}.pdf',
          );
        } else {
          await actions.logAction(
            'Contrat  déja téléchargé',
          );
        }
      } else {
        await actions.logAction(
          'Contrat non signé!   ${currentContratDoc.contratData.status}   ....',
        );
        // Fill liste contrats en  cours
        addToListeContratEnAttente(currentContratDoc.contratData);
        await actions.logAction(
          'contratID : ${listeContratEnAttente.lastOrNull?.title}',
        );
      }

      // Reset ContratDataAppState
      FFAppState().contratDataAppState = ContratDataStruct();
      FFAppState().update(() {});
      // iLoop
      FFAppState().iLoop = FFAppState().iLoop + 1;
    }
    // reset loop
    FFAppState().iLoop = 0;
  }

  Future gestionContratArchive(BuildContext context) async {
    await actions.logAction(
      'Gestion contrat archive',
    );
    listContratSigned = [];
    listContratSigned = (currentUserDocument?.urlContrats.toList() ?? [])
        .toList()
        .cast<DataLabelValueStruct>();
  }
}
