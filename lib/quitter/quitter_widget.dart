import '/auth/firebase_auth/auth_util.dart';
import '/components/kilian_app_bar_accueil/kilian_app_bar_accueil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'quitter_model.dart';
export 'quitter_model.dart';

class QuitterWidget extends StatefulWidget {
  const QuitterWidget({super.key});

  @override
  State<QuitterWidget> createState() => _QuitterWidgetState();
}

class _QuitterWidgetState extends State<QuitterWidget> {
  late QuitterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuitterModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1500));
      GoRouter.of(context).prepareAuthEvent();
      await authManager.signOut();
      GoRouter.of(context).clearRedirectLocation();

      context.goNamedAuth('login', context.mounted);
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
                model: _model.kilianAppBarAccueilModel,
                updateCallback: () => safeSetState(() {}),
                child: const KilianAppBarAccueilWidget(),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Au revoir ',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                  ),
                ]
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
