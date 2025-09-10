import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:marquee/marquee.dart';
import 'package:badges/badges.dart' as badges;
import '../../../bloc/cart/cart_bloc.dart';
import '../../../service/location/location_storage.dart';
import '../../../service/cart/cart_service.dart'; // <-- for CartSessionController

class HCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HCustomAppBar({super.key});

  @override
  State<HCustomAppBar> createState() => _HCustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _HCustomAppBarState extends State<HCustomAppBar> {
  final locationSession = LocationSessionController();
  final cartSessionController = CartSessionController();

  @override
  void initState() {
    super.initState();
    cartSessionController.loadCart().then((_) {
      setState(() {});
    });
  }

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
                  SizedBox(
                    height: 20,
                    child: Text(
                      locationSession.currentPlace?.name ?? "Unknown",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    height: 18,
                    child:
                        locationSession.hasLocation &&
                            (locationSession.currentPlace?.address ?? "")
                                    .length >
                                20
                        ? Marquee(
                            text:
                                locationSession.currentPlace?.address ??
                                "Unknown",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            blankSpace: 20,
                            velocity: 30.0,
                            pauseAfterRound: const Duration(seconds: 1),
                            startPadding: 10,
                            accelerationDuration: const Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: const Duration(seconds: 1),
                            decelerationCurve: Curves.easeOut,
                          )
                        : Text(
                            locationSession.currentPlace?.address ?? "Unknown",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
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
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.wishList);
          },
          icon: const Icon(CupertinoIcons.heart),
          color: Colors.white,
          iconSize: 25,
        ),

        BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) => previous.items != current.items,
          builder: (context, state) {
            return badges.Badge(
              showBadge: cartSessionController.hasItems,
              badgeContent: Text(
                cartSessionController.cartCount.toString(),
                style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w600),
              ),
              position: badges.BadgePosition.topEnd(top: -2, end: 2),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.white,
                padding: EdgeInsets.all(6),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartSection()),
                  );
                },
                icon: const Icon(CupertinoIcons.bag),
                color: Colors.white,
                iconSize: 25,
              ),
            );
          },
        ),

        const SizedBox(width: 6),
      ],
    );
  }
}
