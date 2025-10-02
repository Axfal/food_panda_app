import '../restaurant_exports.dart';

class SetCategoryInputWidget extends StatefulWidget {
  const SetCategoryInputWidget({super.key});

  @override
  State<SetCategoryInputWidget> createState() => _SetCategoryInputWidgetState();
}

class _SetCategoryInputWidgetState extends State<SetCategoryInputWidget> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    final restaurantState = context.read<RestaurantBloc>().state;


    /// parsing selected categories
    if (restaurantState.restaurants != null &&
        restaurantState.restaurants!.isNotEmpty) {
      final restaurantCategories =
          restaurantState.restaurants!.first.categories;
      for (final cat in restaurantCategories) {
        context
            .read<RestaurantBloc>()
            .add(AddCategoryEvent(categoryId: cat.id));
      }
    }
    context.read<CategoryBloc>().add(FetchCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      buildWhen: (current, previous) =>
      current.categoryApiResponse.status !=
          previous.categoryApiResponse.status ||
          current.selectedCategoryIds != previous.selectedCategoryIds ||
          current.categories != previous.categories,
      builder: (context, categoryState) {
        final categories = categoryState.categories;

        // simple placeholder while categories are not loaded
        if (categories.isEmpty) {
          return Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Loading categories...',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
          );
        }

        return BlocBuilder<RestaurantBloc, RestaurantStates>(
          buildWhen: (current, previous) =>
          current.selectedCategoryIds != previous.selectedCategoryIds ||
              current.restaurants != previous.restaurants,
          builder: (context, restaurantState) {
            final selectedCategoryIds = restaurantState.selectedCategoryIds ?? [];

            return Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(14),
              ),
              child: ExpansionTile(
                initiallyExpanded: false,
                title: Text(
                  "Select Categories",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                trailing: Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: AppColors.primary,
                ),
                onExpansionChanged: (expanded) {
                  setState(() {
                    isExpanded = expanded;
                  });
                },
                childrenPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  final isChecked = selectedCategoryIds.contains(category.id);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16),
                        leading: CircleAvatar(
                          backgroundColor:
                          AppColors.primary.withValues(alpha: 0.1),
                          child: Text(
                            '${index + 1}',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        title: Text(
                          category.name,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        trailing: Checkbox(
                          value: isChecked,
                          checkColor: Colors.white,
                          side:
                          BorderSide(color: AppColors.primary, width: 2),
                          activeColor: AppColors.primary,
                          onChanged: (val) {
                            if (val == true) {
                              context.read<RestaurantBloc>().add(
                                AddCategoryEvent(
                                    categoryId: category.id),
                              );
                            } else {
                              context.read<RestaurantBloc>().add(
                                RemoveCategoryEvent(
                                    categoryId: category.id),
                              );
                            }
                          },
                        ),
                        onTap: () {
                          if (isChecked) {
                            context.read<RestaurantBloc>().add(
                              RemoveCategoryEvent(categoryId: category.id),
                            );
                          } else {
                            context.read<RestaurantBloc>().add(
                              AddCategoryEvent(categoryId: category.id),
                            );
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        );
      },
    );
  }
}
