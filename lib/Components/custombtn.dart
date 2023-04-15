import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback ontap;
  final String title;

  CustomBtn({Key? key, required this.title, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xff690B08), borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff0E111E),
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
