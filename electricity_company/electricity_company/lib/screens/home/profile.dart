import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:electricity_company/screens/authenticate/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: Text("شركة الكهرباء الأردنية"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              ap.userSignOut().then((value) => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Welcome())));
            },
          ),
        ],
        centerTitle: true,
        leading: Image.asset("images/logo.png", width: 40),
        leadingWidth: 100,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text("الأسم"),
            Row(
              children: [
                Text(
                  ap.userModel.fname,
                  style: TextStyle(fontSize: 20, color: tdBlue),
                ),
                Text(ap.userModel.sname),
                Text(ap.userModel.tname),
                Text(ap.userModel.lname),
              ],
            ),
            Text(ap.userModel.id),
            Text(ap.userModel.phoneNumber),
          ],
        ),
      ),
    );
  }
}
