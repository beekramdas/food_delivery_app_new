import 'package:flutter/material.dart';

class PaymentTile extends StatefulWidget {
  final String iconPath, iconTitle;
  final bool selectedPayment;

  PaymentTile(
      {super.key,
      required this.iconPath,
      required this.iconTitle,
      required this.selectedPayment});

  @override
  State<PaymentTile> createState() => _PaymentTileState();
}

class _PaymentTileState extends State<PaymentTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 85,
        height: 93,
        child: Column(
          children: [
            Container(
              width: 85,
              height: 72,
              decoration: BoxDecoration(
                color:
                    widget.selectedPayment ? Colors.white : Color(0XFFF0F5FA),
                borderRadius: BorderRadius.circular(9.62),
                border: Border.all(
                  color: widget.selectedPayment
                      ? Color(0XFFFF7622)
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (widget.selectedPayment)
                    Positioned(
                        right: -5,
                        top: -5,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: Color(0XFFFF7622),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  Center(child: Image.asset(widget.iconPath)),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                widget.iconTitle,
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0,
                  color: Colors.blueGrey.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
