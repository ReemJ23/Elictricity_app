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

class Form4 extends StatefulWidget {
  const Form4({super.key});

  @override
  State<Form4> createState() => _Form4State();

}

class _Form4State extends State<Form4> {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  ImagePicker imagePicker = ImagePicker();
  XFile? image1;
  XFile? image2;
  XFile? image3;
  XFile? image4;

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
          title: Text(" طلب كتاب لهجة معينة عن حالة العداد"),
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
                label("صورة عن هوية المشترك او المفوض عنه"),
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

            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  textLabel = value; // Update textLabel with user's input
                });
              },
              decoration: InputDecoration(
                labelText: '', // Remove the labelText from here
                // Add any additional decoration options
              ),
            ),

                const SizedBox(height: 30),
                label("تفويض من المشترك مصدق عليه من البنك"),
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
                label("كتاب من الجهة الرسمية موجه لشركة الكهرباء لإعطاء المطلوب"),
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
                label("براءة ذمه"),
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
                Text(
                  "بعد تسليم الوثائق المطلوبة يتم عملية كشف فني على العداد",
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
                            image4 != null) {
                          String uniqueFileName1 =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          String uniqueFileName2 =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          String uniqueFileName3 =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          String uniqueFileName4 =
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

                          Map<String, dynamic> form1 = {
      'صورة عن هوية المشترك او المفوض عنه': image1Url,
      'تفويض من المشترك مصدق عليه من البنك': image1Ur2,
            'رقم العداد او فاتورة سابقة': textFieldValue, 
      'كتاب من الجهة الرسمية موجه لشركة الكهرباء لإعطاء المطلوب': image1Ur3,
      'براءة ذمه': image1Ur4,
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
