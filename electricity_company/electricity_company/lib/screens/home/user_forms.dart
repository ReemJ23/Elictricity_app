import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForms extends StatefulWidget {
  const UserForms({super.key});

  @override
  State<UserForms> createState() => _UserFormsState();
}

class _UserFormsState extends State<UserForms> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    late DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('users').doc(ap.uid);
    late CollectionReference _referenceTransactions =
        _documentReference.collection('transactions');

    late Stream<QuerySnapshot> _streamTransactions =
        _referenceTransactions.snapshots();

    return Scaffold(
        backgroundColor: tdGrey,
        appBar: AppBar(
          backgroundColor: tdBlue,
          elevation: 0.0,
          title: Text("شركة الكهرباء الأردنية"),
          centerTitle: true,
          leading: Image.asset("images/logo.png", width: 40),
          leadingWidth: 100,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: _streamTransactions,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child:
                                Text('some error occured ${snapshot.error}'));
                      }
                      if (snapshot.hasData) {
                        QuerySnapshot data = snapshot.data;
                        List<QueryDocumentSnapshot> documents = data.docs;
                        List<Map> items = documents
                            .map((e) => {
                                  'id': e.id,
                                  'أسم المعاملة': e['أسم المعاملة'],
                                  'التاريخ': e['التاريخ'],
                                })
                            .toList();
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              Map thisItem = items[index];
                              var ts = int.parse(thisItem['التاريخ']);
                              var dt = DateTime.fromMillisecondsSinceEpoch(ts);
                              var y = dt.year;
                              var m = dt.month;
                              var d = dt.day;
                              String dateString = d.toString() +
                                  '/' +
                                  m.toString() +
                                  '/' +
                                  y.toString();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  tileColor: Colors.white,
                                  title: Text(
                                    thisItem['أسم المعاملة'].toString(),
                                    textAlign: TextAlign.right,
                                  ),
                                  leading: Text(dateString),
                                ),
                              );
                            });
                      }
                      return Center(child: CircularProgressIndicator());
                    }))
          ],
        ));
  }
}
