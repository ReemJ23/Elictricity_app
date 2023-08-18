import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/models/user.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:electricity_company/screens/home/home.dart';
import 'package:electricity_company/screens/wrapper.dart';
import 'package:electricity_company/utils/utils.dart';
import 'package:electricity_company/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final fnameController = TextEditingController();
  final snameController = TextEditingController();
  final tnameController = TextEditingController();
  final lnameController = TextEditingController();
  final idController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fnameController.dispose();
    snameController.dispose();
    tnameController.dispose();
    lnameController.dispose();
    idController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: Image.asset("images/logo.png", width: 65),
        centerTitle: true,
      ),
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: tdBlue,
                ),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            //fname
                            textFeld(
                              hintText: "الاسم الأول",
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: fnameController,
                            ),
                            //sname
                            textFeld(
                              hintText: "اسم الأب",
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: snameController,
                            ),
                            //tname
                            textFeld(
                              hintText: "اسم الجد",
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: tnameController,
                            ),
                            //lname
                            textFeld(
                              hintText: "اسم العائلة",
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: lnameController,
                            ),
                            //id
                            textFeld(
                              hintText: "الرقم الوطني",
                              inputType: TextInputType.number,
                              maxLines: 1,
                              controller: idController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: CustomeButton(
                          text: "واصل",
                          onPressed: () => storeData(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget textFeld({
    required String hintText,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          textAlign: TextAlign.right,
          cursorColor: tdBlue,
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 86, 150, 202)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: tdBlue),
            ),
            hintText: hintText,
            alignLabelWithHint: true,
            border: InputBorder.none,
            fillColor: Colors.blue.shade50,
            filled: true,
          ),
        ));
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        fname: fnameController.text.trim(),
        sname: snameController.text.trim(),
        tname: tnameController.text.trim(),
        lname: lnameController.text.trim(),
        id: idController.text.trim(),
        createdAt: "",
        phoneNumber: "",
        uid: "");
    if (idController.text != "" || idController != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        onSuccess: () {
          //once data is saved we need to store it locally as well
          ap.saveUserDataToSP().then((value) => ap.setSignIn().then((value) =>
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Wrapper()),
                  (route) => false)));
        },
      );
    } else {
      showSnackBar(context, "يجب تزويد الرقم الوطني");
    }
  }
}
