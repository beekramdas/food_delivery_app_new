import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/cart/cart.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

List productSize = ["10", "14", "16"];

List ingredients = [
  ["Salt", "assets/ingredients/salt.png"],
  ["Chicken", "assets/ingredients/chicken.png"],
  ["Onion", "assets/ingredients/onion.png"],
  ["Garlic", "assets/ingredients/garlic.png"],
  ["Pepper", "assets/ingredients/pappers.png"],
];

int selectedIndex = 0;

bool _like = false;

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 321,
                    width: double.maxFinite,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/burger.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 40,
                      left: 10,
                      right: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: Color(0XFF181C2E),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _like = !_like;
                                  print(_like);
                                });
                              },
                              child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: _like
                                      ? Icon(Icons.favorite,
                                          size: 25, color: Color(0XFFFF8400))
                                      : Icon(Icons.favorite_outline,
                                          size: 20, color: Color(0XFFFF8400))),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Burger Bistro",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF181C2E),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/restaurants/restaurant-logo.png",
                      height: 22,
                      width: 22,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Rose Garden",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0XFF181C2E),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      color: Color(0XFFFF7622),
                      size: 20,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "4.8",
                      style: TextStyle(
                        color: Color(0XFF181C2E),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      "assets/images/ui_images/Delivery.png",
                      width: 23,
                      height: 16,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Free",
                      style: TextStyle(
                        color: Color(0XFF181C2E),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.access_time_rounded,
                      color: Color(0XFFFF7622),
                      size: 20,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "20 min",
                      style: TextStyle(
                        color: Color(0XFF181C2E),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Container(
                  width: 323,
                  child: Text(
                    "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0,
                      color: Color(0XFFA0A5BA),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        "SIZE:",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFFA0A5BA),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productSize.length,
                            itemBuilder: (context, index) {
                              bool _isSelected = selectedIndex == index;
                              return Padding(
                                padding: EdgeInsets.only(left: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80),
                                      color: _isSelected
                                          ? Color(0XFFF58D1D)
                                          : Color(0xFFF0F5FA),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${productSize[index]}\"",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: _isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 15, top: 10),
                child: Text(
                  "INGREDIENTS",
                  style: TextStyle(
                    color: Color(0XFF32343E),
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 07, right: 10),
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ingredients.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0XFFFFEBE4),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Image.asset(
                                  ingredients[index][1],
                                ),
                              ),
                            ),
                            Text(
                              ingredients[index][0],
                              style: TextStyle(
                                color: Color(0XFF747783),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
          backgroundColor: Color(0XFFF0F5FA),
          enableDrag: false,
          onClosing: () {},
          builder: (context) {
            return Container(
              height: 149,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "\$32",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 17),
                        child: Container(
                          width: 125,
                          height: 38.87,
                          decoration: BoxDecoration(
                              color: Color(0XFF121223),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 9),
                                height: 19.43,
                                width: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white.withOpacity(0.2)),
                                child: Center(
                                  child: Icon(
                                    Icons.minimize,
                                    size: 14,
                                    weight: 5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 19.43,
                                width: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white.withOpacity(0.2)),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 14,
                                    weight: 5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    },
                    child: Container(
                      height: 50.21,
                      width: 327,
                      decoration: BoxDecoration(
                        color: Color(0XFFFF7622),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "ADD TO CART",
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
            );
          }),
    );
  }
}
