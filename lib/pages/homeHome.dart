import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mitchy_mobile_app/service/auth_service.dart';

class HomeHome extends StatefulWidget {
  const HomeHome({super.key});

  @override
  State<HomeHome> createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              authService.signOut();
            },
            child: Text("LogOut")),
      ),
    );
    // return Scaffold(
    //   body: Container(),
    //   bottomNavigationBar: BottomNavigationBar(items: [
    //     BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.home,
    //         ),
    //         label: "Home"),
    //     BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.message,
    //         ),
    //         label: "Message"),
    //     BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.track_changes,
    //         ),
    //         label: "Tracker"),
    //     BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.attach_money,
    //         ),
    //         label: "Subscription"),
    //   ]),
    // );
  }
}
