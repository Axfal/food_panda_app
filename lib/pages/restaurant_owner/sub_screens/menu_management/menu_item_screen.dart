import 'dart:io';

import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_item/menu_item_model.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../bloc/vendor/menu_management/menu_management_bloc.dart';

class MenuItemScreen extends StatefulWidget {
  final int restaurantId;
  final int categoryId;
  const MenuItemScreen({
    super.key,
    required this.restaurantId,
    required this.categoryId,
  });

  @override
  State<MenuItemScreen> createState() => _MenuItemScreenState();
}

class _MenuItemScreenState extends State<MenuItemScreen> {
  @override
  void initState() {
    super.initState();

    final bloc = context.read<MenuManagementBloc>();

    if (bloc.state.itemsByCategory[widget.categoryId.toString()] == null ||
        bloc.state.itemsByCategory[widget.categoryId.toString()]!.isEmpty) {
      bloc.add(
        FetchItemsEvent(
          restaurantId: widget.restaurantId.toString(),
          categoryId: widget.categoryId.toString(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MyAppBar(
        title: 'Menu Item',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: RefreshIndicator(
          color: Colors.white,
          backgroundColor: AppColors.primary,
          onRefresh: () async {
            context.read<MenuManagementBloc>().add(
              FetchItemsEvent(
                restaurantId: widget.restaurantId.toString(),
                categoryId: widget.categoryId.toString(),
              ),
            );
          },
          child: BlocBuilder<MenuManagementBloc, MenuManagementStates>(
            builder: (context, state) {
              final items =
                  state.itemsByCategory[widget.categoryId.toString()] ?? [];

              if (state.itemsApiResponse.status == Status.loading) {
                return const Center(child: CupertinoActivityIndicator());
              }

              if (state.itemsApiResponse.status == Status.error) {
                return Center(
                  child: Text(
                    state.itemsApiResponse.message ?? 'Error loading items',
                  ),
                );
              }

              return MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final displayPrice = item.variations.isNotEmpty
                      ? 'From ${item.variations.first.price}'
                      : (item.price.isNotEmpty == true ? item.price : '0.00');

                  return GestureDetector(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(16),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  item.photo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: InkWell(
                                  onTap: () {
                                    _openBottomSheet(context, item: item);
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.6,
                                      ),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.25,
                                          ),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Rs. $displayPrice',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item.description,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    height: 1.3,
                                  ),
                                ),
                                if (item.variations.isNotEmpty) ...[
                                  const SizedBox(height: 6),
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: item.variations.map((v) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          v.name,
                                          style: GoogleFonts.poppins(
                                            fontSize: 11,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openBottomSheet(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add Item',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Future<void> _openBottomSheet(BuildContext context, {Item? item}) async {
    // ✅ Controllers defined outside the builder so they persist
    final nameController = TextEditingController(text: item?.name ?? '');
    final priceController = TextEditingController(
      text: item?.price.toString() ?? '',
    );
    final descController = TextEditingController(text: item?.description ?? '');
    bool status = item?.status == 'available';
    String? photo = item?.photo;

    // ✅ Variations initialized here (outside builder)
    final List<Map<String, TextEditingController>> variations = [];
    if (item != null && item.variations.isNotEmpty) {
      for (var v in item.variations) {
        variations.add({
          'name': TextEditingController(text: v.name),
          'price': TextEditingController(text: v.price),
        });
      }
    } else {
      variations.add({
        'name': TextEditingController(),
        'price': TextEditingController(),
      });
    }

    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  top: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Text(
                        item == null ? 'Add New Item' : 'Edit Item',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: nameController,
                        cursorColor: Colors.black54,
                        style: const TextStyle(color: Colors.black87),
                        decoration: _buildInputDecoration(
                          label: 'Item Name',
                          hint: 'Enter item name',
                          icon: Icons.fastfood_outlined,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: priceController,
                        style: const TextStyle(color: Colors.black87),
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black54,
                        decoration: _buildInputDecoration(
                          label: 'Price',
                          hint: 'Enter price',
                          icon: Icons.attach_money_outlined,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        cursorColor: Colors.black54,
                        controller: descController,
                        style: const TextStyle(color: Colors.black87),
                        maxLines: 3,
                        decoration: _buildInputDecoration(
                          label: 'Description',
                          hint: 'Enter description',
                          icon: Icons.description_outlined,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SwitchListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        value: status,
                        activeColor: Colors.white,
                        activeTrackColor: Colors.redAccent,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade300,
                        title: Text(
                          status
                              ? 'Status: Available'
                              : 'Status: Not available',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        secondary: Icon(
                          status ? Icons.check_circle : Icons.cancel,
                          color: status ? Colors.redAccent : Colors.grey,
                        ),
                        onChanged: (val) => setState(() => status = val),
                      ),
                      InkWell(
                        onTap: () async {
                          final picked = await ImagePicker().pickImage(
                            source: ImageSource.gallery,
                          );
                          if (picked != null) {
                            setState(() => photo = picked.path);
                          }
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 110,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade400,
                              style: BorderStyle.solid,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            image: photo != null
                                ? DecorationImage(
                                    image: photo!.startsWith('http')
                                        ? NetworkImage(photo!)
                                        : FileImage(File(photo!))
                                              as ImageProvider,
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: photo == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.grey,
                                      size: 28,
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Upload Photo",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Variations',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: variations.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 4,
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    controller: variations[index]['name'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Variation Name',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 13,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 12,
                                          ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: variations[index]['price'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Price',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 13,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 12,
                                          ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        variations.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            variations.add({
                              'name': TextEditingController(),
                              'price': TextEditingController(),
                            });
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.redAccent,
                          size: 20,
                        ),
                        label: const Text(
                          'Add Variation',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (item == null && photo == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please upload a photo'),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                            return;
                          }

                          final data = {
                            'name': nameController.text,
                            'price': priceController.text,
                            'description': descController.text,
                            'status': status,
                            'photo': photo,
                            'variations': variations
                                .map(
                                  (v) => {
                                    'name': v['name']!.text,
                                    'price': v['price']!.text,
                                  },
                                )
                                .toList(),
                          };
                          Navigator.pop(context, data);
                        },
                        child: Text(
                          item == null ? 'Add Item' : 'Update Item',
                          style: const TextStyle(color: Colors.white),
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
    );

    if (result != null) {
      final variationsList = (result['variations'] as List)
          .map((v) => Variation(name: v['name'], price: v['price']))
          .toList();

      if (item == null) {
        context.read<MenuManagementBloc>().add(
          AddItemEvent(
            restaurantId: widget.restaurantId.toString(),
            categoryId: widget.categoryId.toString(),
            name: result['name'],
            description: result['description'],
            price: result['price'],
            status: result['status'] ? 'available' : 'not_available',
            photo: result['photo'] != null ? File(result['photo']) : null,
            variations: variationsList,
          ),
        );
      } else {
        context.read<MenuManagementBloc>().add(
          UpdateItemEvent(
            itemId: item.id.toString(),
            restaurantId: widget.restaurantId.toString(),
            categoryId: widget.categoryId.toString(),
            name: result['name'],
            description: result['description'],
            price: result['price'],
            status: result['status'] ? 'available' : 'not_available',
            photo: result['photo'] != null ? File(result['photo']) : null,
            variations: variationsList,
          ),
        );
      }
    }
  }

  // ✅ Common InputDecoration builder
  InputDecoration _buildInputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.redAccent),
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      labelStyle: const TextStyle(color: Colors.black54),
      hintStyle: const TextStyle(color: Colors.black38),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    );
  }
}
