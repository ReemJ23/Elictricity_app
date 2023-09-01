import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/provider/auth_provider.dart';
import 'package:electricity_company/screens/forms/1.dart';
import 'package:electricity_company/screens/forms/2.dart';
import 'package:electricity_company/screens/forms/3.dart';
import 'package:electricity_company/screens/forms/4.dart';
import 'package:electricity_company/screens/home/profile.dart';
import 'package:electricity_company/screens/home/user_forms.dart';
import 'package:electricity_company/widgets/transaction.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:electricity_company/screens/wrapper.dart';

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
        title: Text("شركة الكهرباء الأردنية"),
        centerTitle: true,
        leading: Image.asset("images/logo.png", width: 40),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        'المعاملات',
                        style: TextStyle(fontSize: 30),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    Transaction(title: "فصل/ وصل تيار 3 فاز", page: Form1()),
                    Transaction(title: " فصل/ وصل تيار ا فاز", page: Form2()),
                    Transaction(title: "طلب فحص عداد ا فاز / 3 فاز", page: Form3()),
                    Transaction(
                        title: "طلب كتاب لهجة معينة عن حالة العداد",
                        page: Form4()),
                    // Transaction(title: " إنهاء عقد 1 فاز", page: Form1()),
                    // Transaction(title: "  تغير إشتراك مشغول عداد 1 فاز تجاري", page: Form1()),
                    // Transaction(title: " تغير إشتراك مشغول عداد 1 فاز منزلي", page: Form1()),
                    // Transaction(title: " طلب رفع عداد بسبب الهدم ( 1 فاز / 3 فاز )",page: Form1()),
                    // Transaction(title: " تغير تعرفة عداد 1 فاز / 3 فاز", page: Form1()),
                    // Transaction(title: " إنهاء عقد 3 فاز", page: Form1()),                      
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

Widget searchBox() {
  return Container(
    margin: EdgeInsets.only(
      top: 20,
    ),
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
        border: InputBorder.none,
        hintText: 'ابحث',
        hintStyle: TextStyle(color: tdBlack),
      ),
    ),
  );
}
