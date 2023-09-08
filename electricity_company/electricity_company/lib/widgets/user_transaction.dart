import 'package:electricity_company/constants/colors.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: tdBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
