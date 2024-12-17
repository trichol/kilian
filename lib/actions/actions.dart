import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future fullUserDeletion(BuildContext context) async {
  String? delUserDirData;
  bool? isUserDeleted;

  // LOG APPEL DELETE USER
  await actions.logAction(
    'LOG OUT$currentUserEmail',
  );
  delUserDirData = await actions.callDeleteBucketDirectory(
    'users/$currentUserUid/uploads/',
  );
  // LOG APPEL DELETE USER
  await actions.logAction(
    delUserDirData,
  );
  // Delete Firestore user data
  isUserDeleted = await actions.deleteFirebaseUserData();
  if (!isUserDeleted) {
    // Echec suppression Firestoredata
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Anomalie détéctée'),
          content: Text('Impossibe de supprimer : $currentUserEmail'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Continuer'),
            ),
          ],
        );
      },
    );
  }
  // LOG APPEL DELETE USER
  await actions.logAction(
    'FIN SUPPRESSION',
  );
  // Back login page

  context.goNamed('login');
}

Future setGeoLocation(BuildContext context) async {
  ApiCallResponse? userCurrentLocation;

  // LOG
  await actions.logAction(
    'APPEL : Geolocation ',
  );
  // Geolocation
  userCurrentLocation = await GeoJSLocationCall.call();

  // LOG
  await actions.logAction(
    'Geolocation : ${getJsonField(
      (userCurrentLocation.jsonBody ?? ''),
      r'''$''',
    ).toString().toString()}',
  );
  // Update user document

  await currentUserReference!.update(createUsersRecordData(
    location: updateLocationDataStruct(
      LocationDataStruct.maybeFromMap((userCurrentLocation.jsonBody ?? '')),
      clearUnsetFields: false,
    ),
  ));
  if (!(currentUserDocument?.location != null)) {
    // LOG
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Localisation impossible'),
          content: const Text('Votre géolocalisation ne fonctionne pas.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Continuer'),
            ),
          ],
        );
      },
    );
  }
}

Future setFcmToken(BuildContext context) async {
  bool? isNotificationsAllowed;
  String? fcmTokenCurrent;

  // Appel set FCM token
  await actions.logAction(
    'Set FCM token',
  );
  // request permission for  notifications
  isNotificationsAllowed = await actions.requestNotificationPermissionForUser();
  if (isNotificationsAllowed) {
    // get token
    fcmTokenCurrent = await actions.getFcmToken();
    if (fcmTokenCurrent == null || fcmTokenCurrent == '') {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text('Création jeton impossible.'),
            content: const Text('anomalie détectée'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text('Continuer'),
              ),
            ],
          );
        },
      );
    } else {
      // FCM token
      await actions.logAction(
        'Set FCM token  OK!',
      );
      // Update document

      await currentUserReference!.update(createUsersRecordData(
        fcmToken: fcmTokenCurrent,
      ));
    }
  }
}

Future postAccountCreation(BuildContext context) async {
  if (loggedIn == true) {
    // GeoLocation
    await action_blocks.setGeoLocation(context);
    // set Fcm Token
    await action_blocks.setFcmToken(context);
    await action_blocks.initFromDisplayName(context);
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Erreur creation compte'),
          content: const Text('echec creation account'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Continuer'),
            ),
          ],
        );
      },
    );
    // Delete user
    await action_blocks.fullUserDeletion(context);
  }
}

Future initFromDisplayName(BuildContext context) async {
  // LOG
  await actions.logAction(
    'APPEL INIT FROM DISPLAY NAME',
  );
  // Update Name and Nickname

  await currentUserReference!.update(createUsersRecordData(
    name: currentUserDisplayName != ''
        ? functions.extractName(currentUserDisplayName)
        : '',
    nickname: currentUserDisplayName != ''
        ? functions.extractNickname(currentUserDisplayName)
        : '',
  ));
}

Future sendInvitation(BuildContext context) async {
  UsersRecord? destinataire;

  destinataire = await queryUsersRecordOnce(
    queryBuilder: (usersRecord) => usersRecord.where(
      'phone_number',
      isEqualTo: FFAppState().smsDataAppState.recipientPhoneNumber,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (destinataire?.reference != null) {
    // Dialog box
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Notificatioon'),
          content: Text(
              'Vous allez envoyer une invitation à signer ce contrat à ${destinataire?.displayName}.Cette utilisateur a déja l\'application Kilian installé.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Continuer'),
            ),
          ],
        );
      },
    );
    triggerPushNotification(
      notificationTitle: 'Invitation de $currentUserDisplayName',
      notificationText:
          'Consulter vos contrat, une proposition vient de vous être faite!',
      notificationSound: 'default',
      userRefs: [destinataire!.reference],
      initialPageName: 'dashboard',
      parameterData: {},
    );
  } else {
    // Dialog box
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('SMS'),
          content: Text(
              'Vous allez envoyer une invitation  de  signer ce contrat au propriétaire du numéro ${FFAppState().smsDataAppState.recipientPhoneNumber}. Cette utilisateur n\'a pas l\'application Kilian installé. Un lien d\'installation lui sera proposé!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Continuer'),
            ),
          ],
        );
      },
    );
    if (isiOS) {
      await launchUrl(Uri.parse(
          "sms:${FFAppState().smsDataAppState.recipientPhoneNumber}&body=${Uri.encodeComponent(FFAppState().smsDataAppState.message)}"));
    } else {
      await launchUrl(Uri(
        scheme: 'sms',
        path: FFAppState().smsDataAppState.recipientPhoneNumber,
        queryParameters: <String, String>{
          'body': FFAppState().smsDataAppState.message,
        },
      ));
    }
  }

  await actions.logAction(
    '${FFAppState().smsDataAppState.recipientPhoneNumber}$currentUserUid${FFAppState().contratDataAppState.uid}',
  );
  // Dialog box
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: const Text('Notification envoyé'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: const Text('Continuer'),
          ),
        ],
      );
    },
  );
}

Future downloadPdf(BuildContext context) async {
  bool? pdfApplication;
  bool? pdfWeb;

  if (isAndroid || isiOS) {
    // MOBILE
    pdfApplication = await actions.downloadPdf(
      getJsonField(
        FFAppState().contratDataAppState.toMap(),
        r'''$.url''',
      ).toString().toString(),
    );
    if (pdfApplication) {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text('Chargement réussi'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
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
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text('recommencer'),
              ),
            ],
          );
        },
      );
    }
  } else {
    // WEB
    pdfWeb = await actions.downloadPdfWeb(
      getJsonField(
        FFAppState().contratDataAppState.toMap(),
        r'''$.url''',
      ).toString().toString(),
    );
    if (pdfWeb) {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text('Chargement réussi'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
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
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text('recommencer'),
              ),
            ],
          );
        },
      );
    }
  }
}

Future buildContratPdfFromModel(BuildContext context) async {
  await actions.logAction(
    'Appel bloc creation CONTRAT',
  );
}

Future blockSignerContrat(BuildContext context) async {
  bool? fullySigned;
  UsersRecord? currentUserContractantDoc;

  // Demande signature
  var confirmDialogResponse = await showDialog<bool>(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text('Notifications'),
            content: const Text(
                'Envoi d\'une demande  de signature  aux autres contractants.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, false),
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, true),
                child: const Text('Envoyer'),
              ),
            ],
          );
        },
      ) ??
      false;
  if (confirmDialogResponse) {
    await actions.signatureContractant(
      FFAppState().contratDataAppState.uid,
      currentUserUid,
      valueOrDefault(currentUserDocument?.signature, ''),
    );
    fullySigned = await actions.isContratFullySigned(
      FFAppState().contratDataAppState.uid,
    );
    if (fullySigned) {
      await actions.signatureContrat(
        FFAppState().contratDataAppState.uid,
      );
    }
    // iLoop
    FFAppState().iLoop = 0;
    while (FFAppState().iLoop !=
        FFAppState().contratDataAppState.contractantsData.length) {
      // User DOC
      currentUserContractantDoc = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: FFAppState()
              .contratDataAppState
              .contractantsData
              .elementAtOrNull(FFAppState().iLoop)
              ?.uid,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (currentUserContractantDoc?.reference != null) {
        // Envoi Notification
        triggerPushNotification(
          notificationTitle: 'Contrat signé!',
          notificationText:
              'Bonjour,${currentUserDisplayName}Un contrat signé est disponible dans votre rubrique \"mes contrats\".',
          userRefs: [currentUserContractantDoc!.reference],
          initialPageName: 'dashboard',
          parameterData: {},
        );
      }
      // iLoop
      FFAppState().iLoop = FFAppState().iLoop + 1;
    }
    // iLoop
    FFAppState().iLoop = 0;
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Félicitation ....Contrat signé!'),
          content: const Text(
              'Depuis l\'onglet \"mes contrats\", vous pourrez avoir accès à ce contrat. Tant que  ce contrat ne sera pas signé par le(s) autre(s) contractants il sera disponible que sous une forme incomplète.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
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
          title: const Text('Note informative'),
          content: const Text(
              'Depuis l\'onglet \"mes contrats\", vous pourrez signer ce contrat ultèrieurement.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Continuer'),
            ),
          ],
        );
      },
    );
  }
}

Future blockNotificationInvitationContratASigner(BuildContext context) async {
  ContratsRecord? referenceContrat;

  if (!FFAppState().contratDataAppState.isNotificationCreationSent) {
    // GET DOC CONTRAT COURANT
    referenceContrat = await queryContratsRecordOnce(
      queryBuilder: (contratsRecord) => contratsRecord.where(
        'contratData.uid',
        isEqualTo: FFAppState().contratDataAppState.uid,
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    // reset iloop
    FFAppState().iLoop = 0;
    while (FFAppState().iLoop <
        FFAppState().contratDataAppState.contractantsData.length) {
      if (currentUserUid !=
          FFAppState()
              .contratDataAppState
              .contractantsData
              .elementAtOrNull(FFAppState().iLoop)
              ?.uid) {
        // MEMORISATION INFO SMS
        FFAppState().updateSmsDataAppStateStruct(
          (e) => e
            ..recipientPhoneNumber = FFAppState()
                .contratDataAppState
                .contractantsData
                .elementAtOrNull(FFAppState().iLoop)
                ?.phoneNumber
            ..message =
                'Bonjour ${'${FFAppState().contratDataAppState.contractantsData.elementAtOrNull(FFAppState().iLoop)?.genre} ${FFAppState().contratDataAppState.contractantsData.elementAtOrNull(FFAppState().iLoop)?.nom} ${FFAppState().contratDataAppState.contractantsData.elementAtOrNull(FFAppState().iLoop)?.prenom}'},$currentUserDisplayName vous invite à installer le logiciel Kilian. Cliquer sur le lien correspondant à votre mobil.\\nIOS : ${FFAppConstants.urlInstallationKilianIos}\\nAndroid : ${FFAppConstants.urlInstallationKilianAndroid}.',
        );
        // Send notification
        await action_blocks.sendInvitation(context);
      } else {
        await actions.logAction(
          'pas d\'envoi a  $currentUserDisplayName',
        );
      }

      // CREATE DOC MESSAGE

      await MessageRecord.collection.doc().set(createMessageRecordData(
            phoneReceiver: FFAppState()
                .contratDataAppState
                .contractantsData
                .elementAtOrNull(FFAppState().iLoop)
                ?.phoneNumber,
            uidSender: currentUserReference,
            contratId: referenceContrat?.reference,
            type: referenceContrat?.contratData.type,
            datetimeSent: getCurrentTimestamp,
            status: FFAppConstants.listeStatus
                .elementAtOrNull(FFAppConstants.indiceEnAttente),
          ));
      // increment iloop
      FFAppState().iLoop = FFAppState().iLoop + 1;
    }
    // reset iloop
    FFAppState().iLoop = 0;
    // Notification sent
    FFAppState().updateContratDataAppStateStruct(
      (e) => e..isNotificationCreationSent = true,
    );
  }
}
