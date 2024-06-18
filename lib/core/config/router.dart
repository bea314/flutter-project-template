import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:panel_administrativo/modules/views/home/home.dart';
import 'package:panel_administrativo/modules/views/template/template.dart';

final _routerKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

// final routerProvider = Provider<GoRouter>((ref) {});

final GoRouter router = GoRouter(
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

String? _guard(BuildContext context, GoRouterState state) {
  final bool signedIn = false;
  final bool signingIn = state.matchedLocation == '/signin';

  // Go to /signin if the user is not signed in
  if (!signedIn && !signingIn) {
    return '/signin';
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
