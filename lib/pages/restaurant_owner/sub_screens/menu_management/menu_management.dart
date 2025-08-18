import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:excellent_trade_app/bloc/vendor/menu_management/menu_management_bloc.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
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

  final Set<int> expandedIndices = {};

  void toggleExpand(int index, int categoryId) {
    setState(() {
      if (expandedIndices.contains(index)) {
        expandedIndices.remove(index);
      } else {
        expandedIndices.add(index);
        _menuManagementBloc.add(
          FetchItemsEvent(
            refreshItem: false,
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

  void addMenuItem(int categoryIndex, int categoryId) {
    String itemName = '';
    String priceStr = '';
    String description = '';
    String status = 'active';
    File? imageFile;

    final ImagePicker picker = ImagePicker();

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
            child: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: BlocConsumer<MenuManagementBloc, MenuManagementStates>(
                    listener: (context, state) {
                      if (state.itemsApiResponse.status == Status.completed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.itemsApiResponse.data.toString(),
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      } else if (state.itemsApiResponse.status ==
                          Status.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.itemsApiResponse.message ??
                                  'Failed to add item',
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      bool isLoading =
                          state.itemsApiResponse.status == Status.loading;

                      return Column(
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

                          // Item Name
                          TextField(
                            style: GoogleFonts.poppins(color: Colors.black87),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelStyle: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              prefixIcon: const Icon(
                                Icons.fastfood_outlined,
                                color: AppColors.primary,
                              ),
                              labelText: 'Item Name',
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

                          // Description
                          TextField(
                            style: GoogleFonts.poppins(color: Colors.black87),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.description_outlined,
                                color: AppColors.primary,
                              ),
                              labelText: 'Description',
                              labelStyle: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (val) => description = val,
                          ),
                          const SizedBox(height: 12),

                          // Price
                          TextField(
                            style: GoogleFonts.poppins(color: Colors.black87),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.attach_money,
                                color: AppColors.primary,
                              ),
                              labelText: 'Price (USD)',
                              labelStyle: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
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
                          // Image Picker
                          InkWell(
                            onTap: () async {
                              final pickedFile = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              if (pickedFile != null) {
                                setState(() {
                                  imageFile = File(pickedFile.path);
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.image_outlined,
                                    color: AppColors.primary,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      imageFile == null
                                          ? "Select Image from Gallery"
                                          : "Image Selected",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  if (imageFile != null)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        imageFile!,
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                  ),
                                ),
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
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        final price = double.tryParse(priceStr);
                                        if (itemName.trim().isEmpty ||
                                            price == null ||
                                            price <= 0 ||
                                            imageFile == null) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Please fill all fields and select an image",
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        context.read<MenuManagementBloc>().add(
                                          AddItemEvent(
                                            restaurantId: widget.restaurantId,
                                            categoryId: categoryId.toString(),
                                            name: itemName.trim(),
                                            description: description.trim(),
                                            price: price.toString(),
                                            status: status,
                                            photo: imageFile!,
                                          ),
                                        );
                                        _menuManagementBloc.add(
                                          FetchItemsEvent(
                                            refreshItem: true,
                                            restaurantId: widget.restaurantId,
                                            categoryId: categoryId.toString(),
                                          ),
                                        );
                                        Future.delayed(
                                          Duration(seconds: 2),
                                          () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                child: isLoading
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CupertinoActivityIndicator(
                                          color: Colors.black,
                                        ),
                                      )
                                    : Text(
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
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void deleteMenuItem(String categoryId, String itemId) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return BlocConsumer<MenuManagementBloc, MenuManagementStates>(
            listener: (context, state) {
              if (state.itemsApiResponse.status == Status.error) {
                context.flushBarErrorMessage(
                  message: "${state.itemsApiResponse.message}",
                );
              }
              if(state.itemsApiResponse.status == Status.completed){

              }
            },
            builder: (context, state) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  'Delete Item',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                content: Text(
                  'Are you sure you want to delete?',
                  style: GoogleFonts.poppins(color: Colors.black54),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(color: Colors.black54),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: Text(
                      'Delete',
                      style: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      context.read<MenuManagementBloc>().add(
                        DeleteItemEvent(
                          categoryId,
                          itemId,
                          widget.restaurantId,
                        ),
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        print("fetching .....==========");
                        _menuManagementBloc.add(
                          FetchItemsEvent(
                            refreshItem: true,
                            restaurantId: widget.restaurantId,
                            categoryId: categoryId.toString(),
                          ),
                        );
                        Navigator.pop(context);
                      });

                    },
                  ),
                ],
              );
            },
          );
        },
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

                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.95),
                          AppColors.primary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Category Header
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 55,
                              width: 60,
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
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white24,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                isExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 26,
                              ),
                              onPressed: () =>
                                  toggleExpand(catIndex, category.id),
                            ),
                          ),
                          onTap: () => toggleExpand(catIndex, category.id),
                        ),

                        // Items List with smooth expand/collapse
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: isExpanded
                              ? Column(
                                  children: [
                                    if (state.itemsApiResponse.status ==
                                        Status.loading) ...[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                        child: Center(
                                          child: CupertinoActivityIndicator(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ] else if (items.isEmpty)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                        child: Text(
                                          'No items yet.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white70,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      )
                                    else
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            (items[category.id.toString()] ??
                                                    [])
                                                .length,
                                        separatorBuilder: (_, _) => Divider(
                                          color: AppColors.primary,
                                          height: 1,
                                          indent: 20,
                                          endIndent: 20,
                                        ),
                                        itemBuilder: (context, itemIndex) {
                                          final item =
                                              items[category.id
                                                  .toString()]![itemIndex];
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.1),
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 10,
                                                  ),
                                              leading: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: item.photo.isNotEmpty
                                                    ? Image.network(
                                                        item.photo,
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                        errorBuilder:
                                                            (
                                                              _,
                                                              _,
                                                              _,
                                                            ) => Container(
                                                              width: 60,
                                                              height: 60,
                                                              color: Colors
                                                                  .grey[300],
                                                              child: const Icon(
                                                                Icons
                                                                    .broken_image,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                      )
                                                    : Container(
                                                        width: 60,
                                                        height: 60,
                                                        color: Colors.white24,
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
                                                  color: Colors.white,
                                                ),
                                              ),
                                              trailing: IconButton(
                                                icon: const Icon(
                                                  Icons.delete_outline,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () => deleteMenuItem(
                                                  category.id.toString(),
                                                  item.id.toString(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),

                                    // Add Item Button
                                    GestureDetector(
                                      onTap: () =>
                                          addMenuItem(catIndex, category.id),
                                      child: Container(
                                        margin: const EdgeInsets.all(14),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 20,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(
                                            alpha: 0.15,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: Colors.white70,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'Add Item',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
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
