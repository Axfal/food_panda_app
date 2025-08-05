import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../Utils/constants/appWeight.dart';

class BrandList extends StatefulWidget {
  final String title;
  const BrandList({super.key, this.title = "Top Brands"});

  @override
  State<BrandList> createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  final List<Map<String, dynamic>> brands = const [
    {'label': 'Burger Lab'},
    {'label': 'California Pizza'},
    {'label': 'KFC'},
    {'label': 'Broadway Pizza'},
    {'label': 'OPTP'},
    {'label': 'Pizza Max'},
    {'label': 'McDonald\'s'},
    {'label': 'Hardee\'s'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != "") ...[
            Text(
              widget.title,
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: AppWeights.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
          ],
          SizedBox(
            height: 130,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final brand = brands[index];
                return GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.restaurantItems),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.fastfood,
                            size: 34,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 80,
                        child: Text(
                          brand['label'],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontWeight: AppWeights.medium,
                            fontSize: 12,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
