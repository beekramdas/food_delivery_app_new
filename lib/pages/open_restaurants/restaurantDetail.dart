import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/foods/foodDetails.dart';
import 'package:food_delivery_app/pages/foods/foodItemsTile.dart';
import 'package:food_delivery_app/pages/open_restaurants/food_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({super.key});

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  List<String> sliderImages = [
    "assets/restaurants/restaurant1.jpg",
    "assets/restaurants/restaurant2.jpg",
    "assets/restaurants/restaurant3.jpg"
  ];
  PageController imageController = PageController();
  int isSelected = 0;
  List<String> foodItems = ["Burger", "Sandwich", "Pizza", "Hot Dog"];
  List food = [
    ["Burger Ferguson", "Spicy Restaurant", "45"],
    ["Rockin\' Burgers", "Cafecafachino", "40"]
  ];

  @override
  void dispose() {
    super.dispose();
    imageController.dispose();
  }

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
                    height: 271,
                    child: PageView.builder(
                      controller: imageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: sliderImages.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            sliderImages[index],
                            height: 271,
                            width: 375,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                      top: 40,
                      left: 10,
                      right: 10,
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
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.more_horiz,
                                color: Color(0XFF181C2E)),
                          )
                        ],
                      )),
                  Positioned(
                    bottom: 10,
                    left: 120,
                    right: -90,
                    child: SmoothPageIndicator(
                      axisDirection: Axis.horizontal,
                      controller: imageController,
                      count: sliderImages.length,
                      effect: CustomizableEffect(
                        spacing: 15,
                        dotDecoration: DotDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          width: 15,
                          height: 15,
                          color: Colors.grey.shade500, // filled inactive dots
                        ),
                        activeDotDecoration: DotDecoration(
                          width: 15,
                          height: 15,
                          borderRadius: BorderRadius.circular(40.0),
                          color: Colors.white,
                          dotBorder: DotBorder(
                            width: 2,
                            color: Colors.white,
                            padding: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      " 4.8",
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
                      " Free",
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
                      " 20 min",
                      style: TextStyle(
                        color: Color(0XFF181C2E),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  "Spicy Restaurant",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF181C2E),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Container(
                    width: 324,
                    height: 69,
                    child: Text(
                      "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0XFFA0A5BA),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: foodItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = index;
                            });
                            print(isSelected);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: FoodTile(
                                selectFood: isSelected == index,
                                foodName: foodItems[index]),
                          ),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 2),
                      child: Text(
                        "Burger(10)",
                        style: TextStyle(
                          color: Color(0XFF181C2E),
                          fontSize: 20,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 800,
                      child: GridView.builder(
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: food.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 25,
                            childAspectRatio:
                                (MediaQuery.of(context).size.width / 2 - 25) /
                                    ((MediaQuery.of(context).size.width / 2 -
                                            25) *
                                        1.3),
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FoodDetails()));
                                },
                                child: FoodItemsTile(
                                    foodName: food[index][0],
                                    restaurantName: food[index][1],
                                    price: food[index][2]));
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
