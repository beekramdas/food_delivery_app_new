import 'package:flutter/material.dart';

class restaurantTile extends StatefulWidget {
  final String imgPath;
  final String restaurantName;
  final String menu;
  final String rating;
  final String deliveryCharge;
  final Duration deliveryTime;

  restaurantTile(
      {super.key,
      required this.imgPath,
      required this.restaurantName,
      required this.menu,
      required this.rating,
      required this.deliveryCharge,
      required this.deliveryTime});

  @override
  State<restaurantTile> createState() => _restaurantTileState();
}

class _restaurantTileState extends State<restaurantTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Container(
        height: 225,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 137,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.restaurantName,
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 0,
                color: Color(0XFF181C2E),
              ),
            ),
            Text(
              widget.menu,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0,
                color: Color(0XFFA0A5BA),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  widget.rating,
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
                  widget.deliveryCharge,
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
                  "${widget.deliveryTime.inMinutes} min",
                  style: TextStyle(
                    color: Color(0XFF181C2E),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
