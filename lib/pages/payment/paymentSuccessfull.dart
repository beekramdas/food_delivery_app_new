import 'package:flutter/material.dart';

class PaymentSuccessFull extends StatefulWidget {
  const PaymentSuccessFull({super.key});

  @override
  State<PaymentSuccessFull> createState() => _PaymentSuccessFullState();
}

class _PaymentSuccessFullState extends State<PaymentSuccessFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.4,
            ),
            Container(
              width: 228,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Image.asset(
                "assets/images/paymentsuccess.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Congratulations!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 0,
                color: Color(0XFF111A2C),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "You successfully maked a payment,\nenjoy your service!",
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                height: 1.5,
                color: Color(0XFB525C67),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
