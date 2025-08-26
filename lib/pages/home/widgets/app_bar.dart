import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../Utils/constants/app_colors.dart';

class h_CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const h_CustomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, 
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            LucideIcons.mapPin,
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, RoutesName.locationScreen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '10/50 C Lane 6, New Town',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.heart),
          color: Colors.white,
          iconSize: 25,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.bag),
          color: Colors.white,
          iconSize: 25,
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}
