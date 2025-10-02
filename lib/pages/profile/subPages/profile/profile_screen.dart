import 'dart:io';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/pages/profile/subPages/profile/widgets/email_text_field.dart';
import 'package:excellent_trade_app/pages/profile/subPages/profile/widgets/name_text_field.dart';
import 'package:excellent_trade_app/pages/profile/subPages/profile/widgets/new_password_input_widget.dart';
import 'package:excellent_trade_app/pages/profile/subPages/profile/widgets/old_password_input_widget.dart';
import 'package:excellent_trade_app/pages/profile/subPages/profile/widgets/phone_text_field.dart';
import 'package:excellent_trade_app/pages/profile/subPages/profile/widgets/submit_input_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../bloc/account/profile/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (picked == null) {
        print("No image selected");
        return;
      }

      final file = File(picked.path);
      print("Selected image path: ${file.path}");

      // Update UI optimistically (optional if Bloc rebuilds UI)
      setState(() => _selectedImage = file);

      // Send to Bloc
      context.read<ProfileBloc>().add(PhotoChangeEvent(photo: file));
    } catch (e) {
      print("Image picking failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: MyAppBar(
        title: 'Profile',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Image
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BlocBuilder<ProfileBloc, ProfileState>(
                        buildWhen: (current, previous) =>
                            current.userModel.photo !=
                                previous.userModel.photo ||
                            current.photo != previous.photo,
                        builder: (context, state) {
                          final photoUrl = state.userModel.photo;

                          return CircleAvatar(
                            radius: 80,
                            backgroundColor: AppColors.primary.withValues(
                              alpha: 1,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: _selectedImage != null
                                  ? Image.file(
                                      _selectedImage!,
                                      width: 158,
                                      height: 158,
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl: photoUrl,
                                      width: 158,
                                      height: 158,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const Center(
                                            child: CupertinoActivityIndicator(
                                              color: Colors.white70,
                                            ),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                            Icons.person,
                                            size: 55,
                                            color: Colors.white,
                                          ),
                                    ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        right: 2,
                        bottom: 14,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Form Fields
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Edit Info',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        NameTextField(),
                        const SizedBox(height: 16),
                        EmailTextField(),
                        const SizedBox(height: 16),
                        PhoneTextField(),
                        const SizedBox(height: 16),
                        OldPasswordInputWidget(),
                        const SizedBox(height: 16),
                        NewPasswordInputWidget(),
                        const SizedBox(height: 26),
                        SubmitInputWidget(formKey: _formKey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
