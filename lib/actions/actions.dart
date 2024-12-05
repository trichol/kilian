import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future fullUserDeletion(BuildContext context) async {
  bool? isUserDeleted;

  // LOG APPEL DELETE USER
  await actions.logAction(
    'LOG OUT$currentUserEmail',
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
