import 'package:electricity_company/constants/colors.dart';
import 'package:flutter/material.dart';

class UserTrans4 extends StatelessWidget {
  final String img1;
  final String img2;
  final String img3;
  final String id;

  UserTrans4({
    super.key,
    required this.img1,
    required this.img2,
    required this.img3,
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
                label("شهادة سجل تجاري( شهادة الصناعة والتجارة"),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img1),
                    radius: 100,
                  ),
                ),
                label(
                    "رخصة مهن سارية المفعول مطابقة لاسم المشترك ومطابقة للنشاط"),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img2),
                    radius: 100,
                  ),
                ),
                label("رقم العداد او فاتورة سابقة"), // Use label here

                TextField(
                  controller: _controller, // Assign the controller to TextField
                  onChanged: (value) {
                    // No need for setState in a StatelessWidget
                    // Update the textLabel with user's input
                    // textLabel = value;
                  },
                  decoration: InputDecoration(
                    labelText: '', // Remove the labelText from here
                  ),
                ),

                label("صورة عن هوية المشترك"),
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(img3),
                    radius: 100,
                  ),
                ),
                Text(
                  "بعد تسليم الوثائق المطلوبة يتم عملية كشف فني على العداد وتحويله الى دائرة الفحص أو التفتيش",
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
