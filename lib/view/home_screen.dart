import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/vm/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text('Home Screen'),
            automaticallyImplyLeading: false,
            actions: [
              InkWell(
                onTap: () {
                  userPreference.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red), // Add an icon
                      SizedBox(width: 4), // Add spacing between icon and text
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ]),
        body: const SafeArea(
          child: Column(children: []),
        ));
  }
}
