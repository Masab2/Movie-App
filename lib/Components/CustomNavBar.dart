import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final VoidCallback ontap;
  final VoidCallback tap;
  final VoidCallback onchaged;

  CustomNavBar({Key? key, required this.ontap,required this.tap,required this.onchaged,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: Container(
        height: 63,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            color: Color(0xff292B37),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: ontap,
              child: Icon(
                Icons.home,
                size: 33,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: tap,
              child: Icon(
                Icons.category,
                size: 33,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: onchaged,
              child: Icon(
                Icons.person,
                size: 33,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
