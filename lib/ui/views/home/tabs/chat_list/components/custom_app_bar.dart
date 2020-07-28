import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;

  const CustomAppBar(
      {Key key, this.title, this.actions, this.leading, this.centerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kBlackColor,
        border: Border(
          bottom: BorderSide(
            color: separatorColor,
            width: 1.4,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor: kBlackColor,
        elevation: 0,
        leading: leading,
        actions: actions,
        centerTitle: centerTitle,
        title: title,
      ),
    );
  }

//  final Size preferredSized = const Size.fromHeight(kToolbarHeight + 10);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}
