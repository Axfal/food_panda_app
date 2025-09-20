import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../Utils/constants/appWeight.dart';

class BrandList extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> labels;
  final List<String> images;
  final List<VoidCallback> onTaps;

  const BrandList({
    super.key,
    this.title = "Top Brands",
    required this.labels,
    required this.images,
    required this.onTaps,
  });

  @override
  State<BrandList> createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  late List<Map<String, dynamic>> brands;

  @override
  void initState() {
    super.initState();
    brands = widget.labels;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty) ...[
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
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final brand = brands[index];
                return GestureDetector(
                  onTap: widget.onTaps[index],
                  child: Column(
                    children: [
                      // Circle Avatar Style
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary.withValues(alpha: 0.9),
                              AppColors.primary.withValues(alpha: 0.5),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: const EdgeInsets.all(3), // border thickness
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          child: ClipOval(
                            child: Image.asset(
                              widget.images[index],
                              fit: BoxFit.cover,
                              width: 64,
                              height: 64,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 70,
                        child: Text(
                          brand['label'],
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontWeight: AppWeights.medium,
                            fontSize: 11,
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
