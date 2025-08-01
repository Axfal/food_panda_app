import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../Utils/constants/appWeight.dart';

class HorizontalCategoryList extends StatelessWidget {
  const HorizontalCategoryList({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'label': 'Pakistani'},
    {'label': 'Burgers'},
    {'label': 'Pulao'},
    {'label': 'Pizza'},
    {'label': 'Biryani'},
    {'label': 'Fries'},
    {'label': 'Rolls'},
    {'label': 'BBQ'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final label = categories[index]['label'] as String;

          return GestureDetector(
            onTap: () {
              // TODO: handle category tap
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.fastfood_rounded,
                    color: Colors.black38,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: AppWeights.medium,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
