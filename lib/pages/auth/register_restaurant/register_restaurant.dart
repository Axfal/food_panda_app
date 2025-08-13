import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/pages/auth/register_restaurant/widgets/address_input_widget.dart';
import 'package:excellent_trade_app/pages/auth/register_restaurant/widgets/description_input_widget.dart';
import 'package:excellent_trade_app/pages/auth/register_restaurant/widgets/name_input_widget.dart';
import 'package:excellent_trade_app/pages/auth/register_restaurant/widgets/phone_input_widget.dart';
import 'package:excellent_trade_app/pages/auth/register_restaurant/widgets/submit_button.dart';

class RegisterRestaurant extends StatefulWidget {
  const RegisterRestaurant({super.key});

  @override
  State<RegisterRestaurant> createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  File? _logoFile;

  Future<void> _pickLogo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _logoFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: 'Register Restaurant', leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Restaurant Logo Picker
                  /// Restaurant Logo Picker
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: _pickLogo,
                          borderRadius: BorderRadius.circular(65),
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.grey.shade100,
                            backgroundImage: _logoFile != null
                                ? FileImage(_logoFile!)
                                : null,
                            child: _logoFile == null
                                ? Icon(
                                    Icons.camera_alt_rounded,
                                    size: 42,
                                    color: Colors.grey.shade500,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Tap to upload logo',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'PNG, JPG up to 5MB',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Name
                  NameInputWidget(),

                  const SizedBox(height: 16),

                  /// Phone
                  PhoneInputWidget(),

                  /// Address
                  AddressInputWidget(),

                  const SizedBox(height: 16),

                  /// Description
                  DescriptionInputWidget(),

                  const SizedBox(height: 24),

                  /// Submit Button
                  SubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
