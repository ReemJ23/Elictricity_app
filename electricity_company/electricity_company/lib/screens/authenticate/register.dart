import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:electricity_company/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: const Text("شركة الكهرباء الأردنية"),
        centerTitle: true,
        leading: Image.asset("images/logo.png", width: 40),
        leadingWidth: 100,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                      fontSize: 50, color: tdBlue, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "أدخل رقم الهاتف",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: tdBlue,
                  style: const TextStyle(fontSize: 18),
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "+962*********",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: tdBlue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: tdBlue)),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: CustomeButton(
                      onPressed: () => sendPhoneNumber(), text: "تسجيل الدخول"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithhPhone(context, phoneNumber);
  }
}
