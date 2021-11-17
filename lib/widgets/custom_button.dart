import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function ontap;
  final String text;
  final Color textcolor;
  final Color btncolor;
  final IconData iconData;

  CustomButton(
      {this.ontap, this.text, this.textcolor, this.btncolor, this.iconData});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: btncolor, borderRadius: BorderRadius.circular(10)),
          child: Text(text,
              style: TextStyle(
                  color: textcolor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold))),
    );
  }
}
