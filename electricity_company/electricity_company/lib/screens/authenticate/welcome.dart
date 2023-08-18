import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:electricity_company/screens/authenticate/register.dart';
import 'package:electricity_company/screens/home/home.dart';
import 'package:electricity_company/screens/wrapper.dart';
import 'package:electricity_company/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: Text("شركة الكهرباء الأردنية"),
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
                SizedBox(
                  height: 70,
                ),
                const Text(
                  'مرحباً',
                  style: TextStyle(
                      fontSize: 60, color: tdBlue, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "تطبيق معاملات شركة الكهرباء الأردنية يرحب بكم",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: CustomeButton(
                      onPressed: () async {
                        if (ap.isSignedIn == true) {
                          await ap.getDataFromSP().whenComplete(
                                () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wrapper(),
                                  ),
                                ),
                              );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Register(),
                            ),
                          );
                        }
                      },
                      text: "ابدأ"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
