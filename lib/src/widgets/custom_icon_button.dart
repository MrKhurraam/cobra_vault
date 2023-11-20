import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {Key? key, required this.onTap, required this.color, required this.icon})
      : super(key: key);

  Color color;
  var onTap;
  var icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        // color:
        onPressed: null,
        icon: FaIcon(
          this.icon,
          size: 15,
          color: color,
        ),
      ),
    );
  }
}
