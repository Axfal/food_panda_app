import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../Utils/constants/appWeight.dart';
import '../../../globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'widgets/address/address_card.dart';
import 'widgets/address/address_data.dart';
import 'widgets/address/address_form.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MyAppBar(
        title: 'My Addresses',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),

      body: addressList.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Placeholder illustration
                    Icon(
                      Icons.location_off,
                      size: 80,
                      color: AppColors.primary.withOpacity(0.5),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "No addresses added yet",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Add your delivery address to make shopping faster and easier.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddressFormPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text(
                        "Add New Address",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: addressList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return AddressCard(
                  address: addressList[index],
                  onEdit: () {},
                  onDelete: () {},
                );
              },
            ),

      // Floating Add Button
      floatingActionButton: addressList.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddressFormPage()),
                );
              },
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.add_location_alt, color: Colors.white),
              label: const Text(
                "Add Address",
                style: TextStyle(color: Colors.white),
              ),
            )
          : null,
    );
  }
}
