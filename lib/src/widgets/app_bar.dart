import 'package:flutter/material.dart';

import 'change_theme_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar(
      {Key? key,
      required this.title,
      this.showActionButtons: true,
      this.centerTitle = false})
      : super(key: key);
  String title;
  bool showActionButtons;
  bool centerTitle;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: null,
      // iconTheme: Theme.of(context).iconTheme,
      elevation: 0,
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 25),
          child: Visibility(
              visible: showActionButtons, child: const ChangeThemeButton()),
        ),
      ],
    );
  }
}
