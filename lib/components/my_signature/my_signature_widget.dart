import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
    return Container(
      width: 280.0,
      height: 250.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
          width: 2.0,
        ),
      ),
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 12.0,
                  buttonSize: 40.0,
                  fillColor: Colors.black,
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 15.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: ClipRect(
                  child: Signature(
                    controller: _model.signatureController ??=
                        SignatureController(
                      penStrokeWidth: 2.0,
                      penColor: FlutterFlowTheme.of(context).primaryText,
                      exportBackgroundColor: Colors.white,
                    ),
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    width: 210.0,
                    height: 140.0,
                  ),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                final signatureImage = await _model.signatureController!
                    .toPngBytes(height: 140, width: 210);
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
              },
              text: 'Générer',
              options: FFButtonOptions(
                width: 80.0,
                height: 30.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Colors.black,
                textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ].divide(const SizedBox(height: 2.0)),
        ),
      ),
    );
  }
}
