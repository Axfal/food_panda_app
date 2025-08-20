import '../../../../../model/category/category_model.dart';
import '../restaurant_exports.dart';

class SetCategoryInputWidget extends StatefulWidget {
  final List<Categories>? categories;
  const SetCategoryInputWidget({super.key, this.categories});

  @override
  State<SetCategoryInputWidget> createState() => _SetCategoryInputWidgetState();
}

class _SetCategoryInputWidgetState extends State<SetCategoryInputWidget> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    if (widget.categories != null && widget.categories!.isNotEmpty) {
      for (final cat in widget.categories!) {
        context.read<CategoryBloc>().add(AddCategoryIdEvent(cat.id));
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
          current.selectedCategoryIds != previous.selectedCategoryIds,
      builder: (context, state) {
        final categories = state.categories;

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
              final isChecked = state.selectedCategoryIds.contains(category.id);

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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
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
                      side: BorderSide(color: AppColors.primary, width: 2),
                      activeColor: AppColors.primary,
                      onChanged: (val) {
                        if (val == true) {
                          context.read<CategoryBloc>().add(
                            AddCategoryIdEvent(category.id),
                          );
                        } else {
                          context.read<CategoryBloc>().add(
                            RemoveCategoryIdEvent(category.id),
                          );
                        }
                      },
                    ),
                    onTap: () {
                      if (isChecked) {
                        context.read<CategoryBloc>().add(
                          RemoveCategoryIdEvent(category.id),
                        );
                      } else {
                        context.read<CategoryBloc>().add(
                          AddCategoryIdEvent(category.id),
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
  }
}
