import 'package:chat_connect_app/app/config/routes/my_named_routes.dart';
import 'package:chat_connect_app/app/modules/auth/pages/login_page.dart';
import 'package:chat_connect_app/app/modules/auth/pages/register.dart';
import 'package:chat_connect_app/app/modules/auth/pages/spalsh_scree.dart';
import 'package:chat_connect_app/app/modules/home/pages/home_page.dart';
import 'package:chat_connect_app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///[rootNavigatorKey] used for global | general navigation
final rootNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const SizedBox();
      

  /// use this in [MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: MyNamedRoutes.root,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // outside the [ShellRoute] to make the screen on top of the [BottomNavBar]
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyNamedRoutes.root,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child:  SplashScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.login}",
        name: MyNamedRoutes.login,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child:  LoginScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.register}",
        name: MyNamedRoutes.register,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child:  RegisterScreen(),
        ),
      ), GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.home}",
        name: MyNamedRoutes.home,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child:  MyHomeScreen(),
        ),
      ),
      
    ],
    errorBuilder: errorWidget,
  );

  static GoRouter get router => _router;
}