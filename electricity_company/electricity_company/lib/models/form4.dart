import 'package:electricity_company/constants/colors.dart';
import 'package:flutter/material.dart';

class UserTrans4 extends StatelessWidget {
  final String img1;
  final String img2;
  final String img3;
  final String img4;
  final String id;

  UserTrans4({
    super.key,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.img4,
    required this.id,
  });
  final TextEditingController _controller =
      TextEditingController(); // Define TextEditingController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdGrey,
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0.0,
        title: Text("طلب كتاب لهجة معينة عن حالة العداد"),
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
                label("صورة عن هوية المشترك او المفوض عنه"),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img1),
                    radius: 100,
                  ),
                ),
                label("تفويض من المشترك مصدق عليه من البنك"),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img2),
                    radius: 100,
                  ),
                ),
                label("رقم العداد او فاتورة سابقة"), // Use label here
                label(id),

                label(
                    "كتاب من الجهة الرسمية موجه لشركة الكهرباء لإعطاء المطلوب"),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img3),
                    radius: 100,
                  ),
                ),
                label("براءة ذمه"),
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