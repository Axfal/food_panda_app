import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/constants/appWeight.dart';
import '../../auth/forgot_password/forget_password_export.dart';
import 'package:excellent_trade_app/bloc/category/category_bloc.dart';

class CategoriesInputWidget extends StatefulWidget {
  const CategoriesInputWidget({super.key});

  @override
  State<CategoriesInputWidget> createState() => _CategoriesInputWidgetState();
}

class _CategoriesInputWidgetState extends State<CategoriesInputWidget> {
  static const double _itemSize = 70;
  static const double _spacing = 12;
  static const double _textWidth = 80;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          final categories = state.categories;

          if (categories.isEmpty) {
            return const SizedBox(
              height: _itemSize + 60,
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _itemSize + 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 0),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                      Navigator.pushNamed(context, RoutesName.restaurantsByCategory, arguments: {
                        "category_id": category.id.toString()
                      });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: _itemSize,
                            height: _itemSize,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withValues(alpha: 0.15),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              category.image_url ?? '',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.fastfood, size: 32),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: _textWidth,
                            child: Text(
                              category.name,
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
          );
        },
      ),
    );
  }
}
