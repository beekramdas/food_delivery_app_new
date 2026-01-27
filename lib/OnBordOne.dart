import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardOne extends StatefulWidget {
  const OnBoardOne({super.key});

  @override
  State<OnBoardOne> createState() => _OnBoardOneState();
}

class _OnBoardOneState extends State<OnBoardOne> {
  PageController _controller = PageController();
  bool onLastPage = false;
  final bool toShow = false;

  @override
  void initState() {
    getValue();
    super.initState();
  }

  void getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seen = prefs.getBool('toShow') ?? false;
    if (seen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: [
              flyer('assets/images/image2.jpg', 'All your favorites',
                  'Get all your love foods in one place,\n you just place your order we do rest'),
              flyer('assets/images/SplashScreen.jpg', 'All your favourites',
                  'Get all your love foods in one place,\n you just place your order we do rest'),
              flyer('assets/images/image.jpg', 'All your favourites',
                  'Get all your love foods in one place,\n you just place your order we do rest'),
              flyer('assets/images/image4.jpg', 'Order from chosen chef',
                  'Get all your love foods in one place,\n you just place your order we do rest')
            ],
          ),
          Positioned(
              bottom: 200,
              left: 140,
              right: -90,
              child: SmoothPageIndicator(
                  effect: WormEffect(
                    activeDotColor: Color(0xFFFF7622),
                    dotColor: Color(0xFFFFE1CE),
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                  controller: _controller,
                  count: 4)),
          Positioned(
            bottom: 110,
            left: 20,
            child: onLastPage
                ? GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('toShow', true);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      height: 62,
                      width: 327,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFFF7622),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeIn);
                      print(toShow);
                    },
                    child: Container(
                      height: 62,
                      width: 327,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFFF7622),
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
          ),
          if (!onLastPage)
            Positioned(
              bottom: 70,
              left: 160,
              child: GestureDetector(
                onTap: () {
                  _controller.jumpToPage(3);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF646982),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget flyer(image, heading, details) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          height: 292,
          width: 240,
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Text(
        heading,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF32343E),
            fontSize: 24),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        details,
        style: TextStyle(color: Color(0xFF646982), fontSize: 16),
      ),
    ],
  );
}
