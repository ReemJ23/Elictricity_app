import 'package:electricity_company/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UserTrans1 extends StatelessWidget {
  final String img1;
  final String img2;
  final String img3;
  const UserTrans1({
    super.key,
    required this.img1,
    required this.img2,
    required this.img3,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdGrey,
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: Text("فصل/ وصل تيار 3 فاز"),
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
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img1),
                    radius: 100,
                  ),
                ),
                label("فاتورة سابقة"),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img2),
                    radius: 100,
                  ),
                ),
                label("شهادة تفويض مصدقة في حال عدم قدوم الشخص او المالك"),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img3),
                    radius: 100,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "سيتم ارسال الطلب لدائرة الفحص والتفتيش وبعد التأكد من سلامته يتم الموافقة على فصل المشترك إذا كان لعداد سليم او ايصاله",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
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
