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
        title: const Text("شركة الكهرباء الأردنية"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            iconSize: 30,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            const Text(
              "المعلومات الشخصية",
              style: TextStyle(
                  color: tdBlue, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextWithLabel(
                "${ap.userModel.fname} ${ap.userModel.sname} ${ap.userModel.tname} ${ap.userModel.lname}",
                " :الأسم"),
            const SizedBox(height: 20),
            _buildTextWithLabel(ap.userModel.id, " :الرقم الوطني"),
            const SizedBox(height: 20),
            _buildTextWithLabel(ap.userModel.phoneNumber, " :رقم الهاتف"),
          ],
        ),
      ),
    );
  }

  Widget _buildTextWithLabel(String text, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 20, color: tdBlue),
              textAlign: TextAlign.right,
            ),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: tdBlue),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
