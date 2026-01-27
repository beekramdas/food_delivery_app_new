import 'package:flutter/material.dart';

class cartTile extends StatefulWidget {
  final String foodName;
  final int foodPrice, foodSize;
  final bool closeEdit;

  cartTile(
      {super.key,
      required this.foodName,
      required this.foodPrice,
      required this.foodSize,
      required this.closeEdit});

  @override
  State<cartTile> createState() => _cartTileState();
}

class _cartTileState extends State<cartTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Container(
                  height: 117,
                  width: 136,
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(12, 12),
                            blurRadius: 30,
                            spreadRadius: 0,
                            color: Color(0XFF1E1E2E).withValues(alpha: 0.4))
                      ]),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        widget.foodName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "\$${widget.foodPrice.toString()}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 0,
                          height: 1.2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.foodSize.toString()}\"",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 0,
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 9),
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withValues(alpha: 0.2)),
                                child: Center(
                                  child: Icon(
                                    Icons.minimize,
                                    size: 14,
                                    weight: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.2)),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 14,
                                    weight: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.closeEdit)
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                    child: Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 17,
                    color: Colors.white,
                  ),
                )),
              ),
          ],
        ),
      ),
    );
  }
}
