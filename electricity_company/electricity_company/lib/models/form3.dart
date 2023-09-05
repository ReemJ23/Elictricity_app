import 'package:electricity_company/constants/colors.dart';
import 'package:flutter/material.dart';

class UserTrans3 extends StatelessWidget {
  final String img1;
  final String img2;
  final String img3;
  final String img4;
  const UserTrans3({
    super.key,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.img4,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdGrey,
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: Text("طلب فحص عداد 1 فاز / 3 فاز"),
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
                label("تسديد الرسوم المطلوبة والذمم"),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img4),
                    radius: 100,
                  ),
                ),
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
