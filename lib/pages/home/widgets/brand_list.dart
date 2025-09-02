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
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
            height: 130,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final brand = brands[index];
                return GestureDetector(
                  onTap: widget.onTaps[index],
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            widget.images[index],
                            fit: BoxFit.cover,
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
                            fontWeight: FontWeight.w500,
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
