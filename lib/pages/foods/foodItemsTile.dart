import 'package:flutter/material.dart';

class FoodItemsTile extends StatefulWidget {
  final foodName, restaurantName, price;

  FoodItemsTile(
      {super.key,
      required this.foodName,
      required this.restaurantName,
      required this.price});

  @override
  State<FoodItemsTile> createState() => _FoodItemsTileState();
}

class _FoodItemsTileState extends State<FoodItemsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Container(
              height: 79,
              decoration: BoxDecoration(
                  color: Color(0XFB98A8B8),
                  borderRadius: BorderRadius.circular(19)),
            )),
            Text(
              widget.foodName,
              style: TextStyle(
                height: 1.5,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.restaurantName,
              style: TextStyle(
                height: 1.5,
                fontSize: 13,
                color: Color(0XFF646982),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$" + widget.price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0XFFF58D1D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
