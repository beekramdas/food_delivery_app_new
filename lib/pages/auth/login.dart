import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/pages/auth/forgotPassword.dart';
import 'package:food_delivery_app/pages/auth/signup.dart';
import 'package:food_delivery_app/pages/location/location_access.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background color
            Container(
              color: const Color(0xFF1E1E2E),
            ),

            // SVG on top
            SvgPicture.asset(
              "assets/images/ui_images/login.svg",
              colorFilter: const ColorFilter.mode(
                Colors.white12, // or any color you want for the SVG
                BlendMode.srcIn,
              ),
            ),
            Positioned(
              top: 105,
              left: -10,
              right: -10,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Please sign in to your existing account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
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
                child: Center(
                  child: Form(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25, top: 15),
                            child: Text("EMAIL"),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 25, top: 15, right: 25),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Example@gmail.com",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                ),
                                fillColor: Color(0xFFF0F5FA),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, top: 15),
                            child: Text("PASSWORD"),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 25, top: 5, right: 25),
                            child: TextFormField(
                              obscureText: _obscurePassword,
                              obscuringCharacter: "*",
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                  icon: Icon(_obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  color: Color(0xFFB4B9CA),
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                ),
                                fillColor: Color(0xFFF0F5FA),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15, top: 10),
                                child: Checkbox(
                                    side: BorderSide(
                                      width: 1.5,
                                      color: Color(0xFFE3EBF2),
                                      style: BorderStyle.solid,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    activeColor: Color(0xFFE3EBF2),
                                    checkColor: Colors.deepOrangeAccent,
                                    value: _check,
                                    onChanged: (value) {
                                      setState(() {
                                        _check = !_check;
                                        print(value);
                                      });
                                    }),
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                  color: Color(0xFF7E8A97),
                                  fontSize: 13,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 25),

                                ///-----------FORGOT PASSWORD-------------
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword()));
                                  },
                                  child: Text(
                                    "Forgot password",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25, right: 20, top: 15, bottom: 15),

                            ///------------------LOGIN----------
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LocationAccess()));
                              },
                              child: Container(
                                height: 62,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFFFF7622),
                                ),
                                child: Center(
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF646982),
                                ),
                              ),

                              ///-------------SIGN UP--------
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Center(
                                child: Text(
                              "Or",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF646982),
                              ),
                            )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ///----------------FACEBOOK SIGN IN------------
                              GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/social_logos/facebook.png",
                                    height: 62,
                                    width: 62,
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                //GOOGLE SIGN IN
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/social_logos/google_logo.png",
                                      height: 62,
                                      width: 62,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              //APPLE LOG IN
                              GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/social_logos/apple_logo.png",
                                    height: 62,
                                    width: 62,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
