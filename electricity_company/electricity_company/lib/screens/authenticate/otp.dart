import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:electricity_company/screens/authenticate/user_info.dart';
import 'package:electricity_company/utils/utils.dart';
import 'package:electricity_company/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class Otp extends StatefulWidget {
  final String vertificationId;
  const Otp({super.key, required this.vertificationId});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
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
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: tdBlue,
                ),
              )
            : Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'أدخل رمز التحقق',
                        style: TextStyle(
                            fontSize: 50,
                            color: tdBlue,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "تم ارسال رمز الى هاتفك للتحقق من رقم الهاتف",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: tdBlue),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onCompleted: (value) {
                          setState(() {
                            otpCode = value;
                          });
                        },
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: CustomeButton(
                          text: "تحقق",
                          onPressed: () {
                            if (otpCode != null) {
                              verifyOtp(context, otpCode!);
                            } else {
                              showSnackBar(
                                  context, "أدخل الرمز المكون من ستة ارقام");
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "لم يصلك رمز التحقق؟",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "ارسل رمز اخر",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: tdBlue),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  //verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.vertificationId,
      userOtp: userOtp,
      onSuccess: () {
        //checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              //user exists in our app
            } else {
              //new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const UserInfo()),
                  (route) => false);
            }
          },
        );
      },
    );
  }
}
