import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mes_contrats_widget.dart' show MesContratsWidget;
import 'package:flutter/material.dart';

class MesContratsModel extends FlutterFlowModel<MesContratsWidget> {
  ///  Local state fields for this page.

  List<ContratDataStruct> listContratWaitingForMe = [];
  void addToListContratWaitingForMe(ContratDataStruct item) =>
      listContratWaitingForMe.add(item);
  void removeFromListContratWaitingForMe(ContratDataStruct item) =>
      listContratWaitingForMe.remove(item);
  void removeAtIndexFromListContratWaitingForMe(int index) =>
      listContratWaitingForMe.removeAt(index);
  void insertAtIndexInListContratWaitingForMe(
          int index, ContratDataStruct item) =>
      listContratWaitingForMe.insert(index, item);
  void updateListContratWaitingForMeAtIndex(
          int index, Function(ContratDataStruct) updateFn) =>
      listContratWaitingForMe[index] = updateFn(listContratWaitingForMe[index]);

  List<ContratDataStruct> listContratWaitingFromMe = [];
  void addToListContratWaitingFromMe(ContratDataStruct item) =>
      listContratWaitingFromMe.add(item);
  void removeFromListContratWaitingFromMe(ContratDataStruct item) =>
      listContratWaitingFromMe.remove(item);
  void removeAtIndexFromListContratWaitingFromMe(int index) =>
      listContratWaitingFromMe.removeAt(index);
  void insertAtIndexInListContratWaitingFromMe(
          int index, ContratDataStruct item) =>
      listContratWaitingFromMe.insert(index, item);
  void updateListContratWaitingFromMeAtIndex(
          int index, Function(ContratDataStruct) updateFn) =>
      listContratWaitingFromMe[index] =
          updateFn(listContratWaitingFromMe[index]);

  List<ContratDataStruct> listContratRejectedByMe = [];
  void addToListContratRejectedByMe(ContratDataStruct item) =>
      listContratRejectedByMe.add(item);
  void removeFromListContratRejectedByMe(ContratDataStruct item) =>
      listContratRejectedByMe.remove(item);
  void removeAtIndexFromListContratRejectedByMe(int index) =>
      listContratRejectedByMe.removeAt(index);
  void insertAtIndexInListContratRejectedByMe(
          int index, ContratDataStruct item) =>
      listContratRejectedByMe.insert(index, item);
  void updateListContratRejectedByMeAtIndex(
          int index, Function(ContratDataStruct) updateFn) =>
      listContratRejectedByMe[index] = updateFn(listContratRejectedByMe[index]);

  List<ContratDataStruct> listContratRejectedToMe = [];
  void addToListContratRejectedToMe(ContratDataStruct item) =>
      listContratRejectedToMe.add(item);
  void removeFromListContratRejectedToMe(ContratDataStruct item) =>
      listContratRejectedToMe.remove(item);
  void removeAtIndexFromListContratRejectedToMe(int index) =>
      listContratRejectedToMe.removeAt(index);
  void insertAtIndexInListContratRejectedToMe(
          int index, ContratDataStruct item) =>
      listContratRejectedToMe.insert(index, item);
  void updateListContratRejectedToMeAtIndex(
          int index, Function(ContratDataStruct) updateFn) =>
      listContratRejectedToMe[index] = updateFn(listContratRejectedToMe[index]);

  ContratDataStruct? listContratSigned;
  void updateListContratSignedStruct(Function(ContratDataStruct) updateFn) {
    updateFn(listContratSigned ??= ContratDataStruct());
  }

  int? iLoopPage;

  ContratDataStruct? contratCourant;
  void updateContratCourantStruct(Function(ContratDataStruct) updateFn) {
    updateFn(contratCourant ??= ContratDataStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future fillContratsWaitingFromMe(BuildContext context) async {
    // loop
    FFAppState().iLoop = 0;
    // contratsWaintingToMe
    FFAppState().iLoop = 0;
  }

  Future fillContratsWaitingToMe(BuildContext context) async {
    List<UserInWaitingRecord>? docMessageContratsWaitingToMe;

    // contratsWaintingToMe
    docMessageContratsWaitingToMe = await queryUserInWaitingRecordOnce(
      queryBuilder: (userInWaitingRecord) => userInWaitingRecord
          .where(
            'message.label',
            isEqualTo: 'contrat',
          )
          .where(
            'message.value',
            isEqualTo: currentPhoneNumber,
          ),
    );
    // loop
    FFAppState().iLoop = 0;
    // contratsWaintingToMe
    FFAppState().iLoop = 0;
  }

  Future fillContratsRejectedByMe(BuildContext context) async {
    List<UserInWaitingRecord>? docMessageContratsRejectedByMeCopy;

    // contratsWaintingToMe
    docMessageContratsRejectedByMeCopy = await queryUserInWaitingRecordOnce(
      queryBuilder: (userInWaitingRecord) => userInWaitingRecord
          .where(
            'message.label',
            isEqualTo: 'contrat',
          )
          .where(
            'message.value',
            isEqualTo: currentPhoneNumber,
          ),
    );
    // loop
    FFAppState().iLoop = 0;
    // contratsWaintingToMe
    FFAppState().iLoop = 0;
  }

  Future fillContratsRejectedToMe(BuildContext context) async {}

  Future fillContratsSigned(BuildContext context) async {}
}
