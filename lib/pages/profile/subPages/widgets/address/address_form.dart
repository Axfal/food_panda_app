import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';

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
  final TextEditingController NoteToRiderController = TextEditingController();

  String location = "Selected location from map";
  String city = "City detected";
  String selectedOption = "Home";
  String gatedEntry = "Security will let you in";
  bool isGated = false;

  void _openOptionSheet() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, size: 20),
                ),
                const SizedBox(width: 10),
                Text(
                  "Add Address",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: AppWeights.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: AppColors.textSecondary.withOpacity(0.25),
              height: 1,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address details",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(LucideIcons.mapPin, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            location,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            city,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildFormField(muhallaController, "Muhalla"),
              const SizedBox(height: 24),
              Text(
                "Delivery details",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                "Give riders more details about your location",
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _openOptionSheet,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Text(selectedOption),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildFormField(doorInfoController, "Name/number on door"),
              const SizedBox(height: 12),
              _buildFormField(
                landmarkController,
                "Landmark/community (optional)",
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: isGated,
                onChanged: (val) => setState(() => isGated = val!),
                title: Text("House is in a gated community (optional)"),
              ),
              if (isGated) ...[
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How do we get into the community?",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      RadioListTile(
                        value: "Security will let you in",
                        groupValue: gatedEntry,
                        title: Text("Security will let you in"),
                        onChanged: (val) => setState(() => gatedEntry = val!),
                      ),
                      RadioListTile(
                        value: "Entry code",
                        groupValue: gatedEntry,
                        title: Text("Entry code"),
                        onChanged: (val) => setState(() => gatedEntry = val!),
                      ),
                      if (gatedEntry == "Entry code")
                        _buildFormField(
                          entryCodeController,
                          "Enter entry code",
                        ),
                      RadioListTile(
                        value: "Other",
                        groupValue: gatedEntry,
                        title: Text("Other"),
                        onChanged: (val) => setState(() => gatedEntry = val!),
                      ),
                      if (gatedEntry == "Other")
                        _buildFormField(
                          otherEntryController,
                          "Enter instructions",
                        ),
                      _buildFormField(
                        NoteToRiderController,
                        "Additional instructions (optional)",
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Text(
                "Add a label",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                "Label your address to find it faster next time",
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 0,
                children: [
                  _buildChip(Icons.home, "Home"),
                  _buildChip(Icons.work, "Work"),
                  _buildChip(Icons.favorite, "Partner"),
                  _buildChip(Icons.add, "Other"),
                ],
              ),
              const SizedBox(height: 12),
              _buildFormField(
                customLabelController,
                "Custom label (no spaces)",
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    final address = AddressModel(
                      placeType: selectedOption,
                      city: city,
                      note: NoteToRiderController.text.trim(),
                      muhalla: muhallaController.text.trim(),
                      deliveryDetails: isGated ? gatedEntry : "Not gated",
                      doorInfo: doorInfoController.text.trim(),
                      landmark: landmarkController.text.trim(),
                      gatedCommunity: isGated,
                      entryCode: gatedEntry == "Entry code"
                          ? entryCodeController.text.trim()
                          : null,
                      entryOther: gatedEntry == "Other"
                          ? otherEntryController.text.trim()
                          : null,
                      additionalInstructions: NoteToRiderController.text.trim(),
                      label: customLabelController.text.trim().isEmpty
                          ? selectedOption
                          : customLabelController.text.trim(),
                    );
                    addAddress(address);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save and continue",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
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
  }

  Widget _buildFormField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildChip(IconData icon, String label) {
    final isSelected = selectedOption == label;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ChoiceChip(
        showCheckmark: false,
        avatar: Icon(
          icon,
          size: 16,
          color: isSelected ? Colors.white : AppColors.primary,
        ),
        label: Text(label),
        selected: isSelected,
        selectedColor: AppColors.primary,
        backgroundColor: AppColors.white,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : AppColors.primary,
        ),
        side: BorderSide(color: AppColors.primary),
        onSelected: (_) {
          setState(() {
            selectedOption = label;
            customLabelController.clear();
          });
        },
      ),
    );
  }
}
