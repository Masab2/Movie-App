import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  String value, subvalue;
  Icon icon;
  CustomList(
      {Key? key,
      required this.icon,
      required this.value,
      required this.subvalue,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.01),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.01),
        leading: CircleAvatar(
          backgroundColor: Color(0xff690B08),
          child: icon,
        ),
        title: Text(value),
        subtitle: Text(subvalue),
      ),
    );
  }
}
