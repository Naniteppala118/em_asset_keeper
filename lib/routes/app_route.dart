import 'package:em_asset_keeper/features/dashboard/dashboard.dart';
import 'package:em_asset_keeper/features/find_new_assets/view/find_new_assets_screen_two.dart';
import 'package:em_asset_keeper/features/splash/splash_view.dart';
import 'package:em_asset_keeper/routes/route_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesLists.splashScreen,
      routes: <RouteBase>[
        GoRoute(
          path: RoutesLists.splashScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScren();
          },
        ),
       
        GoRoute(
          path: RoutesLists.dashboard,
          builder: (BuildContext context, GoRouterState state) {
            return const DashboardView();
          },
        ),
        GoRoute(
          path: RoutesLists.findNewAssetsTwo,
          builder: (BuildContext context, GoRouterState state) {
            return  FindNewAssetsScreenTwo();
          },
        ),
        
      ],
      errorBuilder: (BuildContext context, GoRouterState state) {
        return const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      });
}