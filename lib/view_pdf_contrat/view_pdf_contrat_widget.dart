import '/auth/firebase_auth/auth_util.dart';
import '/components/kilian_app_bar/kilian_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'view_pdf_contrat_model.dart';
export 'view_pdf_contrat_model.dart';

class ViewPdfContratWidget extends StatefulWidget {
  const ViewPdfContratWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<ViewPdfContratWidget> createState() => _ViewPdfContratWidgetState();
}

class _ViewPdfContratWidgetState extends State<ViewPdfContratWidget> {
  late ViewPdfContratModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewPdfContratModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isUrlContratPdfValid = await actions.checkFileExists(
        widget.url!,
      );
      if (_model.isUrlContratPdfValid != true) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Affichage du contrat impossible'),
              content: Text(widget.url!),
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
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  FlutterFlowPdfViewer(
                    networkPath: widget.url!,
                    horizontalScroll: false,
                  ),
                ]
                    .divide(const SizedBox(height: 10.0))
                    .addToStart(const SizedBox(height: 10.0))
                    .addToEnd(const SizedBox(height: 10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
