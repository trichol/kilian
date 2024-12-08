import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'my_signature_model.dart';
export 'my_signature_model.dart';

class MySignatureWidget extends StatefulWidget {
  const MySignatureWidget({super.key});

  @override
  State<MySignatureWidget> createState() => _MySignatureWidgetState();
}

class _MySignatureWidgetState extends State<MySignatureWidget> {
  late MySignatureModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MySignatureModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 220.0,
        height: 190.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
            width: 4.0,
          ),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
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
                child: ClipRect(
                  child: Signature(
                    controller: _model.signatureControllerController ??=
                        SignatureController(
                      penStrokeWidth: 2.0,
                      penColor: FlutterFlowTheme.of(context).primaryText,
                      exportBackgroundColor:
                          FlutterFlowTheme.of(context).accent3,
                    ),
                    backgroundColor: FlutterFlowTheme.of(context).accent3,
                    width: 210.0,
                    height: 140.0,
                  ),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                final signatureImage =
                    await _model.signatureControllerController!.toPngBytes();
                if (signatureImage == null) {
                  showUploadMessage(
                    context,
                    'Signature is empty.',
                  );
                  return;
                }
                showUploadMessage(
                  context,
                  'Uploading signature...',
                  showLoading: true,
                );
                final downloadUrl = (await uploadData(
                    getSignatureStoragePath(), signatureImage));

                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                if (downloadUrl != null) {
                  safeSetState(() => _model.uploadedSignatureUrl = downloadUrl);
                  showUploadMessage(
                    context,
                    'Success!',
                  );
                } else {
                  showUploadMessage(
                    context,
                    'Failed to upload signature.',
                  );
                  return;
                }

                await currentUserReference!.update(createUsersRecordData(
                  signature: _model.uploadedSignatureUrl,
                ));
                Navigator.pop(context);
              },
              text: 'Générer',
              options: FFButtonOptions(
                width: 80.0,
                height: 30.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: 'Mukta',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ].divide(const SizedBox(height: 2.0)),
        ),
      ),
    );
  }
}
