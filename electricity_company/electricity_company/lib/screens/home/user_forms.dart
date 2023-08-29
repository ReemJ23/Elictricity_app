import 'package:electricity_company/constants/colors.dart';
import 'package:flutter/material.dart';

class UserForms extends StatefulWidget {
  const UserForms({super.key});

  @override
  State<UserForms> createState() => _UserFormsState();
}

class _UserFormsState extends State<UserForms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdGrey,
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: Text("شركة الكهرباء الأردنية"),
        centerTitle: true,
        leading: Image.asset("images/logo.png", width: 40),
        leadingWidth: 100,
      ),
    );
  }
}
