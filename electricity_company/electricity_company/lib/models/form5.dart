import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class UserTrans5 extends StatelessWidget {
  final String id;
  final String uid;
  const UserTrans5({
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
    return documentSnapshot['شهادة سجل تجاري( شهادة الصناعة والتجارة)'];
  }

  Future<String> getTxt() async {
    late DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('users').doc(uid);
    late CollectionReference _referenceTransactions =
        _documentReference.collection('transactions');
    DocumentSnapshot documentSnapshot =
        await _referenceTransactions.doc(id).get();
    return documentSnapshot['رقم العداد او فاتورة سابقة'];
  }

  Future<String> getImg2() async {
    late DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('users').doc(uid);
    late CollectionReference _referenceTransactions =
        _documentReference.collection('transactions');
    DocumentSnapshot documentSnapshot =
        await _referenceTransactions.doc(id).get();
    return documentSnapshot[
        'رخصة مهن سارية المفعول مطابقة لاسم المشترك ومطابقة للنشاط'];
  }

  Future<String> getImg3() async {
    late DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('users').doc(uid);
    late CollectionReference _referenceTransactions =
        _documentReference.collection('transactions');
    DocumentSnapshot documentSnapshot =
        await _referenceTransactions.doc(id).get();
    return documentSnapshot['صورة عن هوية المشترك'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdGrey,
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: Text("تغيري تعرفة عداد 1 فاز / 3 فاز"),
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
                label('شهادة سجل تجاري( شهادة الصناعة والتجارة)'),
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
                label('رقم العداد او فاتورة سابقة'), // Use label here
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: FutureBuilder<String>(
                    future: getTxt(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        String? txt = snapshot.data;
                        return Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 30,
                          alignment: Alignment.centerRight,
                          child: Text(
                            txt!,
                            style: TextStyle(
                              color: tdBlue,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                label(
                    'رخصة مهن سارية المفعول مطابقة لاسم المشترك ومطابقة للنشاط'),
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
                label('صورة عن هوية المشترك'),
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
