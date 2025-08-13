import 'package:excellent_trade_app/bloc/vendor/menu_management/menu_management_bloc.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_category/menu_category_model.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuManagement extends StatefulWidget {
  final String restaurantId;
  const MenuManagement({super.key, required this.restaurantId});

  @override
  State<MenuManagement> createState() => _MenuManagementState();
}

class _MenuManagementState extends State<MenuManagement> {
  late MenuManagementBloc _menuManagementBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _menuManagementBloc = MenuManagementBloc(vendorApiRepository: getIt());
  }

  List<MenuCategory> categories = [
    MenuCategory(
      name: 'Starters',
      items: [
        MenuItem(name: 'Spring Rolls', price: 5.99, imageUrl: ''),
        MenuItem(name: 'Garlic Bread', price: 3.49, imageUrl: ''),
      ],
    ),
    MenuCategory(
      name: 'Main Course',
      items: [
        MenuItem(name: 'Grilled Chicken', price: 12.99, imageUrl: ''),
        MenuItem(name: 'Pasta Alfredo', price: 10.99, imageUrl: ''),
      ],
    ),
  ];

  // Track expanded categories
  final Set<int> expandedIndices = {};

  void toggleExpand(int index, int categoryId) {
    setState(() {
      if (expandedIndices.contains(index)) {
        expandedIndices.remove(index);
      } else {
        expandedIndices.add(index);
        _menuManagementBloc.add(
          FetchItemsEvent(
            restaurantId: widget.restaurantId,
            categoryId: categoryId.toString(),
          ),
        );
      }
    });
  }

  void addCategory() {
    showDialog(
      context: context,
      builder: (context) {
        String newCategoryName = '';
        return AlertDialog(
          title: Text(
            'Add Category',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Category Name'),
            onChanged: (val) => newCategoryName = val,
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text(
                'Add',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              onPressed: () {
                if (newCategoryName.trim().isNotEmpty) {
                  setState(() {
                    categories.add(
                      MenuCategory(name: newCategoryName.trim(), items: []),
                    );
                  });
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void addMenuItem(int categoryIndex) {
    String itemName = '';
    String priceStr = '';
    String imageUrl = '';

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Menu Item',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),

                // Item Name Field
                TextField(
                  cursorColor: Colors.black87,
                  style: GoogleFonts.poppins(color: Colors.black87),
                  autofocus: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.fastfood_outlined,
                      color: AppColors.primary,
                    ),
                    labelText: 'Item Name',
                    labelStyle: GoogleFonts.poppins(color: Colors.black87),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (val) => itemName = val,
                ),
                const SizedBox(height: 12),

                // Price Field
                TextField(
                  cursorColor: Colors.black87,
                  style: GoogleFonts.poppins(color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.attach_money,
                      color: AppColors.primary,
                    ),
                    labelText: 'Price (USD)',
                    labelStyle: GoogleFonts.poppins(color: Colors.black87),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (val) => priceStr = val,
                ),
                const SizedBox(height: 12),

                TextField(
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.image_outlined,
                      color: AppColors.primary,
                    ),
                    labelText: 'Upload Image',
                    labelStyle: GoogleFonts.poppins(color: Colors.black87),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (val) => imageUrl = val,
                ),

                const SizedBox(height: 20),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey[600],
                        textStyle: GoogleFonts.poppins(),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        final price = double.tryParse(priceStr);
                        if (itemName.trim().isEmpty ||
                            price == null ||
                            price <= 0) {
                          return;
                        }
                        setState(() {
                          categories[categoryIndex].items.add(
                            MenuItem(
                              name: itemName.trim(),
                              price: price,
                              imageUrl: imageUrl.trim(),
                            ),
                          );
                          expandedIndices.add(categoryIndex);
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Add',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void deleteMenuItem(int categoryIndex, int itemIndex) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Delete Item',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${categories[categoryIndex].items[itemIndex].name}"?',
          style: GoogleFonts.poppins(color: Colors.black54),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Delete',
              style: GoogleFonts.poppins(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              setState(() {
                categories[categoryIndex].items.removeAt(itemIndex);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: "Menu Management",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: BlocProvider(
        create: (_) =>
            _menuManagementBloc
              ..add(FetchCategoriesEvent(restaurantId: widget.restaurantId)),
        child: BlocBuilder<MenuManagementBloc, MenuManagementStates>(
          buildWhen: (current, previous) =>
              current.categoriesApiResponse.status !=
                  previous.categoriesApiResponse.status ||
              current.itemsApiResponse.status !=
                  previous.itemsApiResponse.status,
          builder: (BuildContext context, state) {
            if (state.categoriesApiResponse.status == Status.loading) {
              return const Center(
                child: CupertinoActivityIndicator(color: Colors.black54),
              );
            }
            if (state.categoriesApiResponse.status == Status.error) {
              return Center(
                child: Text(
                  state.categoriesApiResponse.message ??
                      'Error fetching categories',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.red),
                ),
              );
            }
            final categories = state.categories;
            final items = state.itemsByCategory;

            if (categories.isEmpty) {
              return Center(
                child: Text(
                  'No menu categories yet.',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            return SafeArea(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: categories.length,
                itemBuilder: (context, catIndex) {
                  final category = categories[catIndex];
                  final isExpanded = expandedIndices.contains(catIndex);
                  return Card(
                    color: AppColors.primary,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        // Category Header
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                category.photo,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[800],
                                    child: const Icon(
                                      Icons.broken_image,
                                      size: 28,
                                      color: Colors.white54,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          title: Text(
                            category.name,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                isExpanded
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () =>
                                  toggleExpand(catIndex, category.id),
                            ),
                          ),
                          onTap: () => toggleExpand(catIndex, category.id),
                        ),

                        // Items List
                        AnimatedCrossFade(
                          firstChild: const SizedBox.shrink(),
                          secondChild: Column(
                            children: [
                              if (items.isEmpty)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    'No items yet.',
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey[300],
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                )
                              else
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (items[category.id.toString()] ?? [])
                                          .length,
                                  separatorBuilder: (_, __) => const Divider(
                                    color: Colors.white30,
                                    height: 1,
                                    indent: 16,
                                    endIndent: 16,
                                  ),
                                  itemBuilder: (context, itemIndex) {
                                    final item =
                                        items[category.id
                                            .toString()]![itemIndex];
                                    return ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: item.photo.isNotEmpty
                                            ? Image.network(
                                                item.photo,
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                                errorBuilder: (_, __, ___) =>
                                                    Container(
                                                      width: 60,
                                                      height: 60,
                                                      color: Colors.grey[300],
                                                      child: const Icon(
                                                        Icons.broken_image,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                              )
                                            : Container(
                                                width: 60,
                                                height: 60,
                                                color: Colors.grey[300],
                                                child: const Icon(
                                                  Icons.fastfood,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                      ),
                                      title: Text(
                                        item.name,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        '\$${item.price}',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white70,
                                        ),
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(
                                          Icons.delete_outline,
                                          color: Colors.white,
                                        ),
                                        onPressed: () =>
                                            deleteMenuItem(catIndex, itemIndex),
                                      ),
                                    );
                                  },
                                ),

                              // Add Item Button
                              GestureDetector(
                                onTap: () => addMenuItem(catIndex),
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white54),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Add Item',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          crossFadeState: isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 300),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: addCategory,
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white, size: 25),
        label: Text(
          'Add Category',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class MenuCategory {
  String name;
  List<MenuItem> items;

  MenuCategory({required this.name, required this.items});
}

class MenuItem {
  String name;
  double price;
  String imageUrl;

  MenuItem({required this.name, required this.price, this.imageUrl = ''});
}
