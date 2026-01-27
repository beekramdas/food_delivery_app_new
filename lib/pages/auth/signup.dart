import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Please sign up to get started",
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
                child: Form(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text("NAME"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "John Doe",
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
                            padding: EdgeInsets.only(top: 15),
                            child: Text("EMAIL"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
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
                            padding: EdgeInsets.only(top: 15),
                            child: Text("PASSWORD"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: TextFormField(
                              obscureText: _obscurePassword,
                              obscuringCharacter: "*",
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "* * * * * * * * * *",
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
                                labelStyle: TextStyle(
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
                            padding: EdgeInsets.only(top: 15),
                            child: Text("RE-PASSWORD"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: TextFormField(
                              obscureText: _obscurePassword,
                              obscuringCharacter: "*",
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "* * * * * * * * * *",
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
                                labelStyle: TextStyle(
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
                            padding: EdgeInsets.only(top: 30, bottom: 15),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 62,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFFFF7622),
                                ),
                                child: Center(
                                  child: Text(
                                    'SIGN UP',
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
