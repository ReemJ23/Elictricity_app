import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:electricity_company/screens/forms/1.dart';
import 'package:electricity_company/screens/forms/2.dart';
import 'package:electricity_company/screens/forms/3.dart';
import 'package:electricity_company/screens/forms/4.dart';
import 'package:electricity_company/screens/forms/5.dart';
import 'package:electricity_company/widgets/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: tdGrey,
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: const Text("شركة الكهرباء الأردنية"),
        centerTitle: true,
        leading: Image.asset("images/logo.png", width: 40),
        leadingWidth: 100,
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              iconSize: 35,
              onPressed: () {
                showSearch(context: context, delegate: CustomeSearch());
              }),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 5, right: 10),
                      alignment: Alignment.topRight,
                      child: const Text(
                        'المعاملات',
                        style: TextStyle(fontSize: 30, color: tdBlue),
                      ),
                    ),
                    const Transaction(title: "فصل/ وصل تيار 3 فاز", page: Form1()),
                    const Transaction(title: " فصل/ وصل تيار ا فاز", page: Form2()),
                    const Transaction(
                        title: "طلب فحص عداد ا فاز / 3 فاز", page: Form3()),
                    const Transaction(
                        title: "طلب كتاب لهجة معينة عن حالة العداد",
                        page: Form4()),
                    const Transaction(
                        title: " تغير تعرفة عداد 1 فاز / 3 فاز", page: Form5()),
                    const Transaction(title: " إنهاء عقد 1 فاز", page: Form1()),
                    const Transaction(
                        title: " تغير إشتراك مشغول عداد 1 فاز منزلي",
                        page: Form1()),
                    const Transaction(
                        title: "  تغير إشتراك مشغول عداد 1 فاز تجاري",
                        page: Form1()),
                    const Transaction(
                        title: " طلب رفع عداد بسبب الهدم ( 1 فاز / 3 فاز )",
                        page: Form1()),
                    const Transaction(title: " إنهاء عقد 3 فاز", page: Form1()),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeSearch extends SearchDelegate {
  List<Transaction> allData = [
    const Transaction(title: "فصل/ وصل تيار 3 فاز", page: Form1()),
    const Transaction(title: " فصل/ وصل تيار ا فاز", page: Form2()),
    const Transaction(title: "طلب فحص عداد ا فاز / 3 فاز", page: Form3()),
    const Transaction(title: "طلب كتاب لهجة معينة عن حالة العداد", page: Form4()),
    const Transaction(title: " تغير تعرفة عداد 1 فاز / 3 فاز", page: Form5()),
    const Transaction(title: " إنهاء عقد 1 فاز", page: Form1()),
    const Transaction(title: " تغير إشتراك مشغول عداد 1 فاز منزلي", page: Form1()),
    const Transaction(title: "  تغير إشتراك مشغول عداد 1 فاز تجاري", page: Form1()),
    const Transaction(
        title: " طلب رفع عداد بسبب الهدم ( 1 فاز / 3 فاز )", page: Form1()),
    const Transaction(title: " إنهاء عقد 3 فاز", page: Form1()),
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Transaction> matchQuery = [];
    for (var item in allData) {
      if (item.title.contains(query)) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return result;
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Transaction> matchQuery = [];
    for (var item in allData) {
      if (item.title.contains(query)) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return result;
        });
  }
}
