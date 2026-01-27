import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: 62,
      height: 62,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F5FA),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Background color
            Container(
              color: const Color(0xFF1E1E2E),
            ),

            // SVG on top
            SvgPicture.asset(
              "assets/images/ui_images/forgotpassword.svg",
            ),
            Positioned(
              top: 105,
              left: -10,
              right: -10,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 1),
                      child: Text(
                        "Verification",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "We have sent a code to your email",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "example@gmail.com",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Height / 1.45,
                width: Width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("CODE"),
                          Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Resend",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  Text(
                                    " in.",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "50sec",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 15, right: 25),
                      child: Pinput(
                        length: 4,
                        defaultPinTheme: defaultPinTheme,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0E6ED),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange),
                          ),
                        ),
                        onCompleted: (pin) {
                          print("Entered OTP: $pin");
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 20, top: 30, bottom: 15),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 62,
                          width: 327,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFFFF7622),
                          ),
                          child: Center(
                            child: Text(
                              'VERIFY',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    weight: 2,
                    color: Color(0xFF5E616F),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
