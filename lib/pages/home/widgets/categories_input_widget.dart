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
  static const double _itemWidth = 120;
  static const double _itemHeight = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          final categories = state.categories;

          if (categories.isEmpty) {
            return const SizedBox(
              height: _itemHeight,
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          }

          return SizedBox(
            height: _itemHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.restaurantsByCategory,
                      arguments: {"category_id": category.id.toString()},
                    );
                  },
                  child: Container(
                    width: _itemWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Category Image
                          Image.network(
                            category.image_url ?? '',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.fastfood,
                                size: 40, color: Colors.grey),
                          ),
                          // Gradient overlay
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.6),
                                ],
                              ),
                            ),
                          ),
                          // Category Name
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                category.name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontWeight: AppWeights.semiBold,
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
