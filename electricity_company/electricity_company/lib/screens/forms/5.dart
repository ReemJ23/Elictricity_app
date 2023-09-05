import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/screens/wrapper.dart';
import 'package:electricity_company/utils/utils.dart';
import 'package:electricity_company/widgets/custome_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Form5 extends StatefulWidget {
  const Form5({super.key});

  @override
  State<Form5> createState() => _Form5State();
}

class _Form5State extends State<Form5> {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  ImagePicker imagePicker = ImagePicker();
  XFile? image1;
  XFile? image2;
  XFile? image3;

  TextEditingController _controller = TextEditingController();
  String textLabel = ''; // Add this variable to hold the text field label
  //for selecting image
  void selectImage1() async {
    image1 = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void selectImage2() async {
    image2 = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void selectImage3() async {
    image3 = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  String image1Url = '';
  String image1Ur2 = '';
  String image1Ur3 = '';

  GlobalKey<FormState> key = GlobalKey();
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('transactions');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdGrey,
      appBar: AppBar(
          backgroundColor: tdBlue,
          elevation: 0.0,
          title: Text("  تغيري تعرفة عداد 1 فاز / 3 فاز"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(CupertinoIcons.arrow_left),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Wrapper(),
              ),
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "قم بتعبئة الطلب",
                  style: TextStyle(fontSize: 30, color: tdBlue),
                ),
                const SizedBox(height: 30),
                label("شهادة سجل تجاري( شهادة الصناعة والتجارة)"),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => selectImage1(),
                  child: image1 == null
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Icon(Icons.upload, size: 40),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(image1!.path)),
                          radius: 50,
                        ),
                ),
                label("رقم العداد او فاتورة سابقة"), // Use label here

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      textLabel = value; // Update textLabel with user's input
                    });
                  },
                  cursorColor: tdBlue,
                  style: const TextStyle(fontSize: 18),
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: tdBlue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: tdBlue)),
                  ),
                ),

                const SizedBox(height: 30),
                label(
                    "رخصة مهن سارية المفعول مطابقة لاسم المشترك ومطابقة للنشاط"),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => selectImage2(),
                  child: image2 == null
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Icon(Icons.upload, size: 40),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(image2!.path)),
                          radius: 50,
                        ),
                ),
                const SizedBox(height: 30),
                label("صورة عن هوية المشترك"),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => selectImage3(),
                  child: image3 == null
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Icon(Icons.upload, size: 40),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(image3!.path)),
                          radius: 50,
                        ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                Text(
                  "بعد تسليم الوثائق المطلوبة يتم عملية كشف فني على العداد وتحويله الى دائرة الفحص أو التفتيش",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: CustomeButton(
                      onPressed: () async {
                        if (image1 != null &&
                            image2 != null &&
                            image3 != null &&
                            _controller.text.isNotEmpty) {
                          String uniqueFileName1 =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          String uniqueFileName2 =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          String uniqueFileName3 =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          String textFieldValue = _controller.text;
                          //upload image to firebase storage
                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          Reference referenceDirImages =
                              referenceRoot.child('images');
                          Reference referenceImageToUpload1 =
                              referenceDirImages.child(uniqueFileName1);
                          Reference referenceImageToUpload2 =
                              referenceDirImages.child(uniqueFileName2);
                          Reference referenceImageToUpload3 =
                              referenceDirImages.child(uniqueFileName3);
                          //store the files
                          try {
                            await referenceImageToUpload1
                                .putFile(File(image1!.path));
                            await referenceImageToUpload2
                                .putFile(File(image2!.path));
                            await referenceImageToUpload3
                                .putFile(File(image3!.path));
                            //get url of uploaded image
                            image1Url =
                                await referenceImageToUpload1.getDownloadURL();
                            image1Ur2 =
                                await referenceImageToUpload2.getDownloadURL();
                            image1Ur3 =
                                await referenceImageToUpload3.getDownloadURL();
                          } catch (e) {}

                          //store the image URL inside the corresponding document of database

                          Map<String, dynamic> form5 = {
                            'شهادة سجل تجاري( شهادة الصناعة والتجارة)':
                                image1Url,
                            'رخصة مهن سارية المفعول مطابقة لاسم المشترك ومطابقة للنشاط':
                                image1Ur2,
                            'رقم العداد او فاتورة سابقة': textFieldValue,
                            'صورة عن هوية المشترك': image1Ur3,
                          };
                          //add new item
                          _reference.add(form5);
                          Navigator.pop(context);
                        } else {
                          showSnackBar(context, "الرجاء تعبئة جميع الاوراق");
                        }
                      },
                      text: "ارسل"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget label(String label) {
    return Text(
      label,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: tdBlue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
