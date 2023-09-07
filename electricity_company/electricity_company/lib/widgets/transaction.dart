import 'package:electricity_company/constants/colors.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key, required this.title, required this.page});

  final String title;
  final StatefulWidget page;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Color.fromARGB(192, 66, 95, 119))),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: tdBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => page)),
      ),
    );
  }
}
