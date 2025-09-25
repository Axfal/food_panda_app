import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MenuItemScreen extends StatefulWidget {
  const MenuItemScreen({super.key});

  @override
  State<MenuItemScreen> createState() => _MenuItemScreenState();
}

class _MenuItemScreenState extends State<MenuItemScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'photo':
          'https://itgenesis.space/Panda_API/API/uploads/menu_items/item_68a437e09732f5.40037927.png',
      'name': 'Burger',
      'description': 'Juicy beef burger with fresh veggies',
      'price': '123.00',
      'variations': [
        {'name': 'Small', 'price': '800.00'},
        {'name': 'Medium', 'price': '1200.00'},
        {'name': 'Large', 'price': '1500.00'},
        {'name': 'Family', 'price': '2000.00'},
        {'name': 'Party', 'price': '2500.00'},
        {'name': 'Small', 'price': '800.00'},
        {'name': 'Medium', 'price': '1200.00'},

        {'name': 'Family', 'price': '2000.00'},
        {'name': 'Party', 'price': '2500.00'},
      ],
    },
    {
      'photo':
          'https://itgenesis.space/Panda_API/API/uploads/menu_items/item_68a437e09732f5.40037927.png',
      'name': 'Burger',
      'description': 'Juicy beef burger with fresh veggies',
      'price': '123.00',
      'variations': [
        {'name': 'Small', 'price': '800.00'},
        {'name': 'Party', 'price': '2500.00'},
      ],
    },
    {
      'photo':
          'https://itgenesis.space/Panda_API/API/uploads/menu_items/item_68a437e09732f5.40037927.png',
      'name': 'Burger',
      'description': 'Juicy beef burger with fresh veggies',
      'price': '123.00',
      'variations': [
        {'name': 'Small', 'price': '800.00'},
        {'name': 'Medium', 'price': '1200.00'},
        {'name': 'Large', 'price': '1500.00'},
        {'name': 'Family', 'price': '2000.00'},

        {'name': 'Party', 'price': '2500.00'},
      ],
    },
    {
      'photo':
          'https://itgenesis.space/Panda_API/API/uploads/menu_items/item_68a437e09732f5.40037927.png',
      'name': 'Burger',
      'description': 'Juicy beef burger with fresh veggies',
      'price': '123.00',
      'variations': [
        {'name': 'Small', 'price': '800.00'},
      ],
    },
    {
      'photo':
          'https://itgenesis.space/Panda_API/API/uploads/menu_items/item_68a437e09732f5.40037927.png',
      'name': 'Burger',
      'description': 'Juicy beef burger with fresh veggies',
      'price': '123.00',
      'variations': [
        {'name': 'Small', 'price': '800.00'},
        {'name': 'Party', 'price': '2500.00'},
      ],
    },
    {
      'photo':
          'https://itgenesis.space/Panda_API/API/uploads/menu_items/item_68a437e09732f5.40037927.png',
      'name': 'Burger',
      'description': 'Juicy beef burger with fresh veggies',
      'price': '123.00',
      'variations': [
        {'name': 'Small', 'price': '800.00'},
        {'name': 'Medium', 'price': '1200.00'},
        {'name': 'Large', 'price': '1500.00'},
        {'name': 'Family', 'price': '2000.00'},
        {'name': 'Party', 'price': '2500.00'},
        {'name': 'Small', 'price': '800.00'},
        {'name': 'Medium', 'price': '1200.00'},
        {'name': 'Large', 'price': '1500.00'},
        {'name': 'Family', 'price': '2000.00'},
        {'name': 'Party', 'price': '2500.00'},
        {'name': 'Small', 'price': '800.00'},
        {'name': 'Medium', 'price': '1200.00'},
        {'name': 'Large', 'price': '1500.00'},
        {'name': 'Family', 'price': '2000.00'},
        {'name': 'Party', 'price': '2500.00'},
      ],
    },
    {
      'photo':
          'https://itgenesis.space/Panda_API/API/uploads/menu_items/item_68d2393ad48ee9.04508879.png',
      'name': 'Veg Cheese Pizza',
      'description': 'Fresh pizza with veggies',
      'price': '1200.00',
      'variations': [],
    },
    {
      'photo':
          'https://itgenesis.space/Panda_API/API/uploads/menu_items/item_68d23a4d643498.04633781.png',
      'name': 'Veg Cheese Pizza',
      'description': 'Fresh pizza with veggies',
      'price': null,
      'variations': [],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Menu Item',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),

      // Staggered grid
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            final variations = item['variations'] as List;
            final price = item['price'] as String?;
            final displayPrice = variations.isNotEmpty
                ? 'From ${variations.first['price']}'
                : price ?? '0.00';

            return GestureDetector(
              onTap: () => _openBottomSheet(context, item),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(
                      alpha: 0.4,
                    ), // softer border
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.06,
                      ), // very subtle shadow
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                        item['photo'],
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Rs. $displayPrice',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['description'],
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          if (variations.isNotEmpty)
                            Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              children: variations
                                  .map(
                                    (v) => Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent.withValues(
                                          alpha: 0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        '${v['name']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openBottomSheet(context, null),
        label: Text(
          'Add Item',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: const Icon(Icons.add, color: Colors.white, weight: 20),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _openBottomSheet(BuildContext context, Map<String, dynamic>? item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white, // <-- directly set white background
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final nameController = TextEditingController(text: item?['name'] ?? '');
        final priceController = TextEditingController(
          text: item?['price'] ?? '',
        );
        final descController = TextEditingController(
          text: item?['description'] ?? '',
        );

        bool status = item?['status'] ?? true;
        String? photo = item?['photo'];

        // Variations
        List<Map<String, TextEditingController>> variations = [];
        if (item?['variations'] != null) {
          for (var v in item!['variations']) {
            variations.add({
              'name': TextEditingController(text: v['name']),
              'price': TextEditingController(text: v['price']),
            });
          }
        } else {
          variations.add({
            'name': TextEditingController(),
            'price': TextEditingController(),
          });
        }

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
                      // drag handle
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
                        value: status,
                        activeColor: Colors.redAccent,
                        title: const Text(
                          'Status (Active/Inactive)',
                          style: TextStyle(color: Colors.black87),
                        ),
                        onChanged: (val) => setState(() => status = val),
                      ),

                      InkWell(
                        onTap: () async {},
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
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            image: photo != null
                                ? DecorationImage(
                                    image: NetworkImage(photo),
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
                                // Variation Name (more width)
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
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // Price (smaller)
                                Expanded(
                                  flex: 1, // smaller portion
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
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),

                                // Delete Button
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
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        label: Text(
                          'Add Variation',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primary.withValues(alpha: .09),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Save Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
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
  }

  // Common InputDecoration builder for cleaner style
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
