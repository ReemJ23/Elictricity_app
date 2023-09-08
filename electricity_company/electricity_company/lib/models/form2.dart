import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class UserTrans2 extends StatelessWidget {
  final String id;
  final String uid;
  const UserTrans2({
    super.key,
    required this.id,
    required this.uid,
  });

  Future<String> getImg1() async {
    late DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('users').doc(uid);
    late CollectionReference _referenceTransactions =
        _documentReference.collection('transactions');
    DocumentSnapshot documentSnapshot =
        await _referenceTransactions.doc(id).get();
    return documentSnapshot['صورة عن الهوية'];
  }

  Future<String> getImg2() async {
    late DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('users').doc(uid);
    late CollectionReference _referenceTransactions =
        _documentReference.collection('transactions');
    DocumentSnapshot documentSnapshot =
        await _referenceTransactions.doc(id).get();
    return documentSnapshot['فاتورة سابقة'];
  }

  Future<String> getImg3() async {
    late DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('users').doc(uid);
    late CollectionReference _referenceTransactions =
        _documentReference.collection('transactions');
    DocumentSnapshot documentSnapshot =
        await _referenceTransactions.doc(id).get();
    return documentSnapshot[
        'شهادة تفويض مصدقة في حال عدم قدوم الشخص او المالك'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdGrey,
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: Text("فصل/ وصل تيار 1 فاز"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () => Navigator.pop(context),
          iconSize: 40,
        ),
        leadingWidth: 50,
      ),
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
                label("صورة عن الهوية"),
                InkWell(
                  child: FutureBuilder<String>(
                    future: getImg1(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        String? img1 = snapshot.data;
                        return CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.network(img1!),
                          radius: 100,
                        );
                      }
                    },
                  ),
                ),
                label("فاتورة سابقة"),
                InkWell(
                  child: FutureBuilder<String>(
                    future: getImg2(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        String? img2 = snapshot.data;
                        return CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.network(img2!),
                          radius: 100,
                        );
                      }
                    },
                  ),
                ),
                label("شهادة تفويض مصدقة في حال عدم قدوم الشخص او المالك"),
                InkWell(
                  child: FutureBuilder<String>(
                    future: getImg3(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        String? img3 = snapshot.data;
                        return CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.network(img3!),
                          radius: 100,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                label("جاري النظر في المعاملة"),
                const SizedBox(height: 10),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: LinearPercentIndicator(
                      lineHeight: 8,
                      width: MediaQuery.of(context).size.width * 0.75,
                      percent: 30 / 100,
                      animation: true,
                      animationDuration: 1500,
                      leading: Text(
                        "30%",
                        style: TextStyle(fontSize: 20, color: tdBlue),
                      ),
                      progressColor: tdBlue,
                      backgroundColor: Colors.white,
                    )),
                const SizedBox(height: 20),
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
