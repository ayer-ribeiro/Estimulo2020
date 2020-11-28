import 'package:flutter/material.dart';
import 'package:estimulo2020/values/colors.dart';

class Button extends StatelessWidget {
  Button({
    @required this.title,
    @required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
  }) : super();

  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      textColor: Colors.white,
      color: backgroundColor,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
