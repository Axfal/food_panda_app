import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:excellent_trade_app/bloc/vendor/menu_management/menu_management_bloc.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_category/menu_category_model.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart' hide Category;
import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'menu_item_screen.dart';

class MenuManagement extends StatefulWidget {
  final String restaurantId;
  const MenuManagement({super.key, required this.restaurantId});

  @override
  State<MenuManagement> createState() => _MenuManagementState();
}

class _MenuManagementState extends State<MenuManagement> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<MenuManagementBloc>();
    if (bloc.state.categories == null || bloc.state.categories.isEmpty) {
      context.read<MenuManagementBloc>().add(
        FetchCategoriesEvent(restaurantId: widget.restaurantId),
      );
    }
  }

  void _openBottomSheet({Category? category}) {
    final nameController = TextEditingController(text: category?.name ?? '');
    File? imageFile;
    String? existingPhoto = category?.photo;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (context, setSheetState) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 20,
                  right: 20,
                  top: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // grab handle
                      Container(
                        width: 50,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      Text(
                        category == null ? 'Add Category' : 'Edit Category',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // name field
                      TextField(
                        controller: nameController,
                        cursorColor: Colors.black54,
                        style: const TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.category_outlined,
                            color: Colors.black54,
                          ),
                          labelText: 'Category Name',
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.black54,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // image picker
                      GestureDetector(
                        onTap: () async {
                          final pickedFile = await ImagePicker().pickImage(
                            source: ImageSource.gallery,
                          );
                          if (pickedFile != null) {
                            setSheetState(() {
                              imageFile = File(pickedFile.path);
                              existingPhoto = null;
                            });
                          }
                        },
                        child: Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey.shade300),
                            image: imageFile != null
                                ? DecorationImage(
                              image: FileImage(imageFile!),
                              fit: BoxFit.cover,
                            )
                                : (existingPhoto != null &&
                                existingPhoto!.isNotEmpty)
                                ? DecorationImage(
                              image: NetworkImage(
                                  existingPhoto!),
                              fit: BoxFit.cover,
                            )
                                : null,
                          ),
                          child: (imageFile == null && existingPhoto == null)
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add_a_photo_outlined,
                                  color: Colors.grey),
                              SizedBox(height: 6),
                              Text(
                                "Upload Category Image",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 13),
                              ),
                            ],
                          )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // submit button
                      BlocBuilder<MenuManagementBloc, MenuManagementStates>(
                        builder: (context, state) {
                          final isLoading = state.categoriesApiResponse.status ==
                              Status.loading;

                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: isLoading
                                ? null
                                : () {
                              final name = nameController.text.trim();
                              if (name.isEmpty) return;

                              if (category == null) {
                                // add category
                                if (imageFile == null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        'Please upload category image'),
                                  ));
                                  return;
                                }
                                context.read<MenuManagementBloc>().add(
                                  AddCategoryEvent(
                                    restaurantId: '6',
                                    categoryName: name,
                                    image: imageFile!,
                                  ),
                                );
                              } else {
                                // update category
                                context.read<MenuManagementBloc>().add(
                                  UpdateCategoryEvent(
                                    categoryId: category.id.toString(),
                                    restaurantId: '6',
                                    name: name,
                                    photo: imageFile,
                                  ),
                                );
                              }

                              Navigator.pop(context);
                            },
                            child: isLoading
                                ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                                : Text(
                              category == null
                                  ? 'Add Category'
                                  : 'Update Category',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showDeleteDialog(Category cat) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Delete Category",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "Are you sure you want to delete this category? This action cannot be undone.",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child:
                        BlocBuilder<MenuManagementBloc, MenuManagementStates>(
                          builder: (context, state) {
                            final isDeleting =
                                state.categoriesApiResponse.status ==
                                Status.loading;

                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: isDeleting
                                  ? null
                                  : () {
                                      context.read<MenuManagementBloc>().add(
                                        DeleteCategoryEvent(
                                          categoryId: '18', //cat.id.toString(),
                                          restaurantId:
                                              '6', // widget.restaurantId,
                                        ),
                                      );
                                      Navigator.of(ctx).pop();
                                    },
                              child: isDeleting
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      "Delete",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                            );
                          },
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final randomHeights = [180.0, 220.0, 160.0, 200.0, 240.0];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MyAppBar(
        title: 'Menu Category',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openBottomSheet(),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: RefreshIndicator(
        backgroundColor: AppColors.primary,
        onRefresh: () async {
          context.read<MenuManagementBloc>().add(
            FetchCategoriesEvent(restaurantId: widget.restaurantId),
          );
          await Future.delayed(const Duration(milliseconds: 300));
        },
        child: BlocBuilder<MenuManagementBloc, MenuManagementStates>(
          builder: (context, state) {
            final categories = state.categories;
            if (state.categoriesApiResponse.status == Status.loading) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 350),
                  Center(
                    child: CupertinoActivityIndicator(color: Colors.black54),
                  ),
                ],
              );
            }

            if (state.categoriesApiResponse.status == Status.error) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 250),
                  Center(
                    child: Text(
                      state.categoriesApiResponse.message ?? 'Error',
                      style: GoogleFonts.poppins(color: Colors.black87),
                    ),
                  ),
                ],
              );
            }

            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                itemCount: categories.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final height = randomHeights[index % randomHeights.length];
                  return GestureDetector(
                    onLongPress: () => _showDeleteDialog(cat),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuItemScreen(restaurantId: 6, categoryId: 2,),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: cat.photo,
                            height: height,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (c, s) => Container(
                              height: height,
                              color: Colors.grey[200],
                            ),
                            errorWidget: (c, s, e) => Container(
                              height: height,
                              color: Colors.grey[200],
                              child: const Icon(Icons.image_not_supported),
                            ),
                          ),
                          Container(
                            height: height,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.4),
                                ],
                              ),
                            ),
                          ),
                          // circular edit button at top right
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () => _openBottomSheet(category: cat),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 10,
                            right: 10,
                            child: Text(
                              cat.name,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
