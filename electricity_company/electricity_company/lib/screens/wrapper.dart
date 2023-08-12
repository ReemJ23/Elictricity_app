import 'package:electricity_company/screens/authenticate/authenticate.dart';
import 'package:electricity_company/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    //return either home or authenticate widget based on user loged in or not
    return Home();
  }
}