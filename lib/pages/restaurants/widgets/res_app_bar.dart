import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String imgpath;
  const ResAppBar({super.key, required this.imgpath});
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back),
      ),
      title: Image.asset(imgpath, height: 55),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.info)),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart)),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.share)),
      ],
    );
  }
}
