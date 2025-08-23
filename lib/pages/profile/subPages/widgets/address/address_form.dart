import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';

import '../../../../../globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'model/address_model.dart';
import 'address_data.dart';
import 'option_buttom_sheet.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({super.key});

  @override
  State<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  final TextEditingController muhallaController = TextEditingController();
  final TextEditingController doorInfoController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController entryCodeController = TextEditingController();
  final TextEditingController otherEntryController = TextEditingController();
  final TextEditingController customLabelController = TextEditingController();
  final TextEditingController noteToRiderController = TextEditingController();

  String location = "Selected location from map";
  String city = "City detected";
  String selectedOption = "Home";
  String gatedEntry = "Security will let you in";
  bool isGated = false;

  void _openOptionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.65,
          child: OptionBottomSheet(
            selectedValue: selectedOption,
            onSelect: (value) {
              setState(() => selectedOption = value);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // PURE WHITE scaffold
      appBar: MyAppBar(
        title: 'Add Address',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- Address Section ----------
            _sectionTitle("📍 Address Details"),
            const SizedBox(height: 10),
            _cardContainer(
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(LucideIcons.mapPin, color: AppColors.primary, size: 22),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(location,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.textPrimary,
                            )),
                        const SizedBox(height: 3),
                        Text(city,
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: AppColors.textSecondary.withOpacity(0.8),
                            )),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text("Edit",
                        style: GoogleFonts.montserrat(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5,
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildFormField(muhallaController, "Muhalla / Street"),

            // -------- Delivery Section ----------
            const SizedBox(height: 28),
            _sectionTitle("🚚 Delivery Details",
                subtitle: "Help riders locate you faster"),
            const SizedBox(height: 14),

            GestureDetector(
              onTap: _openOptionSheet,
              child: _cardContainer(
                Row(
                  children: [
                    Text(selectedOption,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.textPrimary)),
                    const Spacer(),
                    Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildFormField(doorInfoController, "Name / Number on Door"),
            const SizedBox(height: 12),
            _buildFormField(landmarkController,
                "Landmark / Community (optional)"),

            const SizedBox(height: 22),
            CheckboxListTile(
              dense: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              value: isGated,
              onChanged: (val) => setState(() => isGated = val!),
              title: Text("🏡 House in a gated community (optional)",
                  style: GoogleFonts.montserrat(fontSize: 13.5)),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: AppColors.primary,
              contentPadding: EdgeInsets.zero,
            ),

            if (isGated) ...[
              _cardContainer(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Access Instructions",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.textPrimary,
                        )),
                    const Divider(),
                    _radioTile("Security will let you in"),
                    _radioTile("Entry code"),
                    if (gatedEntry == "Entry code")
                      _buildFormField(entryCodeController, "Enter entry code"),
                    _radioTile("Other"),
                    if (gatedEntry == "Other")
                      _buildFormField(otherEntryController, "Enter instructions"),
                    const SizedBox(height: 10),
                    _buildFormField(noteToRiderController,
                        "Additional instructions (optional)"),
                  ],
                ),
              ),
            ],

            // -------- Label Section ----------
            const SizedBox(height: 30),
            _sectionTitle("🏷️ Add a Label",
                subtitle: "Save this address for quick access"),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 10,
              children: [
                _buildChip(Icons.home, "Home"),
                _buildChip(Icons.work, "Work"),
                _buildChip(Icons.favorite, "Partner"),
                _buildChip(Icons.add, "Other"),
              ],
            ),
            const SizedBox(height: 16),
            _buildFormField(customLabelController, "Custom Label (no spaces)"),
            const SizedBox(height: 110),
          ],
        ),
      ),

      // Floating bottom Save button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.check_circle_outline, color: Colors.white),
            label: Text(
              "Save and Continue",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 2,
            ),
            onPressed: _saveAddress,
          ),
        ),
      ),
    );
  }

  // ---------- Widgets ----------
  Widget _buildFormField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      style: GoogleFonts.montserrat(fontSize: 14, color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(fontSize: 13.5),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      ),
    );
  }

  Widget _buildChip(IconData icon, String label) {
    final isSelected = selectedOption == label;
    return ChoiceChip(
      showCheckmark: false,
      avatar: Icon(icon,
          size: 16, color: isSelected ? Colors.white : AppColors.primary),
      label: Text(label, style: GoogleFonts.montserrat(fontSize: 13)),
      selected: isSelected,
      selectedColor: AppColors.primary,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
      side: BorderSide(color: AppColors.primary),
      onSelected: (_) {
        setState(() {
          selectedOption = label;
          customLabelController.clear();
        });
      },
    );
  }

  Widget _cardContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _sectionTitle(String title, {String? subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Colors.black87,
            )),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(subtitle,
              style: GoogleFonts.montserrat(
                fontSize: 13,
                color: AppColors.textSecondary.withOpacity(0.8),
              )),
        ],
      ],
    );
  }

  Widget _radioTile(String value) {
    return RadioListTile(
      value: value,
      groupValue: gatedEntry,
      title: Text(value, style: GoogleFonts.montserrat(fontSize: 13.5)),
      activeColor: AppColors.primary,
      onChanged: (val) => setState(() => gatedEntry = val!),
    );
  }

  void _saveAddress() {
    final address = AddressModel(
      placeType: selectedOption,
      city: city,
      note: noteToRiderController.text.trim(),
      muhalla: muhallaController.text.trim(),
      deliveryDetails: isGated ? gatedEntry : "Not gated",
      doorInfo: doorInfoController.text.trim(),
      landmark: landmarkController.text.trim(),
      gatedCommunity: isGated,
      entryCode:
      gatedEntry == "Entry code" ? entryCodeController.text.trim() : null,
      entryOther:
      gatedEntry == "Other" ? otherEntryController.text.trim() : null,
      additionalInstructions: noteToRiderController.text.trim(),
      label: customLabelController.text.trim().isEmpty
          ? selectedOption
          : customLabelController.text.trim(),
    );
    addAddress(address);
    Navigator.pop(context);
  }
}
