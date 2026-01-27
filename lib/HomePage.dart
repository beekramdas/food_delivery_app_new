import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/pages/category/category_tile.dart';
import 'package:food_delivery_app/pages/open_restaurants/restaurantDetail.dart';
import 'package:food_delivery_app/pages/open_restaurants/restaurantTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> categoryItems = [
    ["All", "assets/category_menu/flame.png", false],
    ["Hot Dog", "assets/category_menu/hot-dog.png", false],
    ["Burger", "assets/category_menu/cheese-burger.png", false],
    ["Pizza", "assets/category_menu/pizza.png", false],
  ];
  List<List<dynamic>> restaurants = [
    [
      "assets/restaurants/restaurant1.jpg",
      "Rose Garden Restaurant",
      "Burger - Chicken - Riche - Wings",
      "4.7",
      "Free",
      Duration(minutes: 20)
    ],
    [
      "assets/restaurants/restaurant2.jpg",
      "Red Hunt Restaurant",
      "Burger - Chicken - Riche - Wings",
      "4.7",
      "Free",
      Duration(minutes: 20)
    ]
  ];
  int selectedIndex = 0;
  int selectedRestaurant = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      color: Color(0xFFECF0F4),
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/ui_images/Menu.svg",
                          width: 12,
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DELIVER TO",
                          style: TextStyle(
                            color: Color(0xFFFC6E2A),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Halal Lab office",
                              style: TextStyle(
                                color: Color(0xFF676767),
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xFF181C2E),
                              size: 29,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 49,
                    width: 45,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            "assets/images/ui_images/shopping-bag.svg",
                            height: 20,
                            width: 18,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFF7622),
                            ),
                            child: const Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 15),
                child: Row(
                  children: [
                    Text(
                      "Hey Halal, ",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 0,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Good Afternoon!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF6F6F6),
                  prefixIcon: const Icon(Icons.search_rounded,
                      color: Color(0xFFA0A5BA)),
                  hintText: "Search dishes, restaurants",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF676767),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "All categories",
                      style: TextStyle(
                        color: Color(0xFF32343E),
                        fontSize: 20,
                        letterSpacing: 0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "See All  ",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16,
                            letterSpacing: -0.33,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                          color: Color(0xFFA0A5BA),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 65,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CategoryTile(
                          title: categoryItems[index][0],
                          imgPath: categoryItems[index][1],
                          isSelected: selectedIndex == index,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Open Restaurants",
                    style: TextStyle(
                      color: Color(0xFF32343E),
                      fontSize: 20,
                      letterSpacing: 0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "See All  ",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          letterSpacing: -0.33,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: Color(0xFFA0A5BA),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemCount: restaurants.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRestaurant = index;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestaurantDetail()));
                      },
                      child: restaurantTile(
                          imgPath: restaurants[index][0],
                          restaurantName: restaurants[index][1],
                          menu: restaurants[index][2],
                          rating: restaurants[index][3],
                          deliveryCharge: restaurants[index][4],
                          deliveryTime: restaurants[index][5]),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
