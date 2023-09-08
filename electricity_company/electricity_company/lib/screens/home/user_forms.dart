import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/models/form2.dart';
import 'package:electricity_company/models/form1.dart';
import 'package:electricity_company/models/form3.dart';
import 'package:electricity_company/models/form4.dart';
import 'package:electricity_company/models/form5.dart';
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

    late DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').doc(ap.uid);
    late CollectionReference referenceTransactions =
        documentReference.collection('transactions');

    late Stream<QuerySnapshot> streamTransactions =
        referenceTransactions.snapshots();

    return Scaffold(
        backgroundColor: tdGrey,
        appBar: AppBar(
          backgroundColor: tdBlue,
          elevation: 0.0,
          title: const Text("شركة الكهرباء الأردنية"),
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
                    stream: streamTransactions,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child:
                                Text('some error occured ${snapshot.error}'));
                      }
                      if (snapshot.hasData) {
                        QuerySnapshot data = snapshot.data;
                        List<QueryDocumentSnapshot> documents = data.docs;
                        List<Map> name = documents
                            .map((e) => {
                                  'id': e.id,
                                  'أسم المعاملة': e['أسم المعاملة'],
                                  'التاريخ': e['التاريخ'],
                                })
                            .toList();
                        return ListView.builder(
                            itemCount: name.length,
                            itemBuilder: (context, index) {
                              Map thisItem = name[index];
                              var ts = int.parse(thisItem['التاريخ']);
                              var dt = DateTime.fromMillisecondsSinceEpoch(ts);
                              var y = dt.year;
                              var m = dt.month;
                              var d = dt.day;
                              String dateString = '$d/$m/$y';
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    tileColor: Colors.white,
                                    title: Text(
                                      thisItem['أسم المعاملة'].toString(),
                                      textAlign: TextAlign.right,
                                    ),
                                    leading: Text(dateString),
                                    onTap: () {
                                      if (thisItem['أسم المعاملة'] ==
                                          'فصل/ وصل تيار 3 فاز') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UserTrans1(
                                              id: thisItem['id'].toString(),
                                              uid: ap.uid,
                                            ),
                                          ),
                                        );
                                      }
                                      if (thisItem['أسم المعاملة'] ==
                                          'فصل/ وصل تيار 1 فاز') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UserTrans2(
                                              id: thisItem['id'].toString(),
                                              uid: ap.uid,
                                            ),
                                          ),
                                        );
                                      }
                                      if (thisItem['أسم المعاملة'] ==
                                          'طلب فحص عداد 1 فاز / 3 فاز') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UserTrans3(
                                              id: thisItem['id'].toString(),
                                              uid: ap.uid,
                                            ),
                                          ),
                                        );
                                      }
                                      if (thisItem['أسم المعاملة'] ==
                                          'طلب كتاب لهجة معينة عن حالة العداد') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UserTrans4(
                                              id: thisItem['id'].toString(),
                                              uid: ap.uid,
                                            ),
                                          ),
                                        );
                                      }
                                      if (thisItem['أسم المعاملة'] ==
                                          'تغيري تعرفة عداد 1 فاز / 3 فاز') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UserTrans5(
                                              id: thisItem['id'].toString(),
                                              uid: ap.uid,
                                            ),
                                          ),
                                        );
                                      }
                                    }),
                              );
                            });
                      }
                      return const Center(child: CircularProgressIndicator());
                    }))
          ],
        ));
  }
}
