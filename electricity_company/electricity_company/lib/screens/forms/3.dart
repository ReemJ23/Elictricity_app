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

class Form3 extends StatefulWidget {
  const Form3({super.key});

  @override
  State<Form3> createState() => _Form3State();
}

class _Form3State extends State<Form3> {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  ImagePicker imagePicker = ImagePicker();
  XFile? image1;
  XFile? image2;
  XFile? image3;
  XFile? image4;


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
   void selectImage4() async {
    image3 = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  String image1Url = '';
  String image1Ur2 = '';
  String image1Ur3 = '';
  String image1Ur4 = '';

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
          title: Text(" طلب فحص عداد ا فاز / 3 فاز"),
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
                label("صورة عن الهوية"),
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
                const SizedBox(height: 30),
                label("فاتورة سابقة"),
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
                label("شهادة تفويض مصدقة في حال عدم قدوم الشخص او المالك"),
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
                 const SizedBox(height: 30),
                label("تسديد الرسوم المطلوبة والذمم"),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => selectImage4(),
                  child: image4 == null
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Icon(Icons.upload, size: 40),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(image4!.path)),
                          radius: 50,
                        ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
             
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: CustomeButton(
                      onPressed: () async {
                        if (image1 != null &&
                            image2 != null &&
                            image3 != null &&
                            image4 != null) {
                          String uniqueFileName1 =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          String uniqueFileName2 =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          String uniqueFileName3 =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          String uniqueFileName4 =
                              DateTime.now().microsecondsSinceEpoch.toString();
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
                          Reference referenceImageToUpload4 =
                              referenceDirImages.child(uniqueFileName4);
                          //store the files
                          try {
                            await referenceImageToUpload1
                                .putFile(File(image1!.path));
                            await referenceImageToUpload2
                                .putFile(File(image2!.path));
                            await referenceImageToUpload3
                                .putFile(File(image3!.path));
                            await referenceImageToUpload4
                                .putFile(File(image4!.path));
                            //get url of uploaded image
                            image1Url =
                                await referenceImageToUpload1.getDownloadURL();
                            image1Ur2 =
                                await referenceImageToUpload2.getDownloadURL();
                            image1Ur3 =
                                await referenceImageToUpload3.getDownloadURL();
                            image1Ur4 =
                                await referenceImageToUpload4.getDownloadURL();
                          } catch (e) {}

                          //store the image URL inside the corresponding document of database

                          Map<String, String> form1 = {
                            'صورة عن الهوية': image1Url,
                            'فاتورة سابقة': image1Ur2,
                            'شهادة تفويض مصدقة في حال عدم قدوم الشخص او المالك':image1Ur3,
                            'تسديد الرسوم المطلوبة والذمم': image1Ur4,
                          };
                          //add new item
                          _reference.add(form1);
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
