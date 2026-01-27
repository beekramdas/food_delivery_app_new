import 'package:flutter/material.dart';

class FoodTile extends StatefulWidget {
  final String foodName;
  final bool selectFood;

  FoodTile({super.key, required this.selectFood, required this.foodName});

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 46,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: widget.selectFood ? Colors.transparent : Color(0XFFEDEDED),
        ),
        borderRadius: BorderRadius.circular(33),
        color: widget.selectFood ? Color(0XFFF58D1D) : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Text(
          widget.foodName,
          style: TextStyle(
              fontSize: 16,
              color: widget.selectFood ? Colors.white : Color(0XFF181C2E)),
        ),
      ),
    );
  }
}
