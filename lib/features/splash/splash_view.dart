import 'package:em_asset_keeper/routes/route_list.dart';
import 'package:em_asset_keeper/services/navigation_service.dart';
import 'package:flutter/material.dart';

class SplashScren extends StatefulWidget {
  const SplashScren({super.key});

  @override
  _SplashScrenState createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/letter-e.png',
          width: 70,
          height: 70,
        ),
      ),
    );
  }

  @override
  void initState() {
    checkUserSession();
    super.initState();
  }

  checkUserSession() async {
    await Future.delayed(const Duration(seconds: 3));
    //await PermissionService.requestPermissionsSequentially();
    

    NavigationServices().replaceWith(RoutesLists.dashboard);
  }
}
