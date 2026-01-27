import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/payment/paymentSuccessfull.dart';
import 'package:food_delivery_app/pages/payment/paymentTile.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

List paymentDetails = [
  ["assets/payment/cash.png", "Cash"],
  ["assets/payment/visa.png", "Visa"],
  ["assets/payment/mastercard.png", "Mastercard"],
  ["assets/payment/paypal.png", "PayPal"],
];
int paymentIndex = 0;

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFECF0F4),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0XFF181C2E),
                        size: 17,
                        weight: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Payment",
                  style: TextStyle(
                    color: Color(0XFF181C2E),
                    fontSize: 17,
                    letterSpacing: 0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: paymentDetails.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          paymentIndex = index;
                        });
                      },
                      child: PaymentTile(
                          iconPath: paymentDetails[index][0],
                          iconTitle: paymentDetails[index][1],
                          selectedPayment: paymentIndex == index),
                    );
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.3,
            ),
            Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "TOTAL:",
                        style: TextStyle(
                          color: Colors.blueGrey.shade300,
                          letterSpacing: 0,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$96",
                        style: TextStyle(
                          color: Color(0XFF181C2E),
                          letterSpacing: 0,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentSuccessFull()));
              },
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Container(
                  height: 62,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color(0XFFFF7622),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "PAY & CONFIRM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
