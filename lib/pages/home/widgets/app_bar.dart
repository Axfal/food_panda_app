import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../service/location/location_storage.dart';

class HCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HCustomAppBar({super.key});

  @override
  State<HCustomAppBar> createState() => _HCustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _HCustomAppBarState extends State<HCustomAppBar> {
  final locationSession = LocationSessionController();

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
          const Icon(LucideIcons.mapPin, color: Colors.white, size: 26),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.locationScreen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locationSession.hasLocation
                        ? locationSession.currentPlace?.name ?? "Unknown"
                        : "Unknown",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    locationSession.hasLocation
                        ? locationSession.currentPlace?.address ?? "Unknown"
                        : "Unknown",
                    maxLines: 2,
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
