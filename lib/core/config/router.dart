import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:panel_administrativo/modules/views/home/home.dart';
import 'package:panel_administrativo/modules/views/template/template.dart';

final _routerKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routeInformationProvider =
    ChangeNotifierProvider<GoRouteInformationProvider>((ref) {
  final router = ref.watch(routerProvider);
  return router.routeInformationProvider;
});

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _routerKey,
    // initialLocation: '/login',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (BuildContext context, GoRouterState state) =>
            const TemplateScreen(),
      ),
    ],
    redirect: _guard,
    // refreshListenable: _auth,
    debugLogDiagnostics: true,
  );
});

// TODO: IMPROVE _guard AND implemeta refreshListenable: _auth
// TODO: INSERT VALIDATE USER AND SECRET STORAGE

String? _guard(BuildContext context, GoRouterState state) {
  final bool signedIn = false;
  final bool signingIn = state.matchedLocation == '/signin';

  // Go to /signin if the user is not signed in
  if (!signedIn && !signingIn) {
    return '/login';
  }
  // Go to /books if the user is signed in and tries to go to /signin.
  else if (signedIn && signingIn) {
    return '/home';
  }

  // no redirect
  return null;
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ));

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}

// Future<bool> validateUser(ProviderRef<GoRouter> ref) async {}
