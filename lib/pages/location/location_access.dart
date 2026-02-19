import 'package:flutter/material.dart';
import 'package:food_delivery_app/HomePage.dart';

class LocationAccess extends StatefulWidget {
  const LocationAccess({super.key});

  @override
  State<LocationAccess> createState() => _LocationAccessState();
}

class _LocationAccessState extends State<LocationAccess> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.3,
                ),
                Container(
                  height: 250,
                  width: 206,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(90),
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                      topLeft: Radius.circular(90),
                    ),
                    color: Color(0xFF98A8B8),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    height: 62,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFFF7622),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ACCESS LOCATION',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/images/ui_images/map_pin.png",
                          height: 32,
                          width: 32,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    child: Text(
                  "DFOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF646982),
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
