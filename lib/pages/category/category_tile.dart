import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  final String title;
  final String imgPath;
  final bool isSelected;

  const CategoryTile({
    super.key,
    required this.title,
    required this.imgPath,
    required this.isSelected,
  });

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(39),
          color: widget.isSelected ? Color(0xFFFFD27C) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEFE6E1),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 2),
            )
          ]),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              shape: BoxShape.circle,
            ),
            child: Image.asset(widget.imgPath),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
