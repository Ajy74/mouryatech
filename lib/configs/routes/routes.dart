
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mourytech/configs/routes/route_name.dart';
import 'package:mourytech/view/home/home_screen.dart';
import 'package:mourytech/view/splash/splash_screen.dart';

class AppRoutes{
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: RouteName.splashScreen,
        builder: (context, state) => const SplashScreen(),
        routes: [

          GoRoute(
            name: RouteName.homeScreen,
            path: RouteName.homeScreen,
            pageBuilder: (context, state) {
               return customPageRouteBuilderBottomToTop(
                const HomeScreen(),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
          ),

        ]
      )
    ]
  ); 
}

CustomTransitionPage customPageRouteBuilder(Widget page, LocalKey pageKey, {required Duration transitionDuration}) {
  return CustomTransitionPage(
    key: pageKey,
    child: page,
    fullscreenDialog: true,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: transitionDuration,
  );
}


CustomTransitionPage customPageRouteBuilderBottomToTop(Widget page, LocalKey pageKey, {required Duration transitionDuration}) {
  return CustomTransitionPage(
    key: pageKey,
    child: page,
    fullscreenDialog: true,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: transitionDuration,
  );
}