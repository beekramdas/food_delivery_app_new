import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/cart/cartTile.dart';
import 'package:food_delivery_app/pages/payment/payment.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List _foodItems = [
    ["Pizza Calzone European", 64, 14],
    ["Pizza Calzone European", 32, 14],
    ["Pizza Calzone European", 35, 14],
    ["Pizza Calzone European", 40, 14],
  ];
  bool _edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1E1E2E),
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
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
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 17,
                            weight: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        letterSpacing: 0,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _edit = !_edit;
                        });
                      },
                      child: !_edit
                          ? Text(
                              "EDIT ITEMS",
                              style: TextStyle(
                                color: Color(0XFFFF7622),
                                fontSize: 14,
                                letterSpacing: 0,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0XFFFF7622),
                                decorationStyle: TextDecorationStyle.solid,
                                decorationThickness: 1,
                              ),
                            )
                          : Text(
                              "DONE",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0XFF059C6A),
                                letterSpacing: 0,
                                fontSize: 14,
                                color: Color(0XFF059C6A),
                                fontWeight: FontWeight.bold,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationThickness: 1,
                              ),
                            ),
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 310, top: 10),
                      primary: true,
                      shrinkWrap: true,
                      itemCount: _foodItems.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        print("Rendering tile: ${_foodItems[index][0]}");
                        return Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: cartTile(
                            foodName: _foodItems[index][0],
                            foodPrice: _foodItems[index][1],
                            foodSize: _foodItems[index][2],
                            closeEdit: _edit,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 310,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "DELIVERY ADDRESS",
                        style: TextStyle(
                          color: Color(0XFFA0A5BA),
                          fontSize: 14,
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        "EDIT",
                        style: TextStyle(
                          color: Color(0XFFFF7622),
                          letterSpacing: 0,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0XFFFF7622),
                          decorationThickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 62,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey.shade50,
                    ),
                    child: Center(
                      child: Text(
                        "2118 Thornridge Cir. Syracuse",
                        style: TextStyle(
                          color: Colors.blueGrey.shade300,
                          letterSpacing: 0,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Breakdown ",
                              style: TextStyle(
                                color: Color(0XFFFF7622),
                                letterSpacing: 0,
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Color(0xFF181C2E),
                            )
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Payment()));
                    },
                    child: Container(
                      height: 62,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color(0XFFFF7622),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "PLACE ORDER",
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
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
