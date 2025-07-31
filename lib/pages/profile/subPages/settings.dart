import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/customeButtons.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = 'English';
  bool pushNotification = false;
  bool offersByEmail = false;
  bool floatingIcon = false;

  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Arabic',
    'Hindi',
    'Urdu',
    'Russian',
    'Japanese',
    'Korean',
    'Portuguese',
    'Turkish',
    'Italian',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Settings',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Preferences"),
            SizedBox(height: 12.h),
            _buildLanguageCard(),
            SizedBox(height: 24.h),
            _buildSectionTitle("Notifications"),
            SizedBox(height: 12.h),
            _buildSwitchTile("Push Notifications", pushNotification, (val) {
              setState(() => pushNotification = val);
            }),
            _buildSwitchTile("Offers via Email", offersByEmail, (val) {
              setState(() => offersByEmail = val);
            }),
            _buildSwitchTile("Floating Action Icon", floatingIcon, (val) {
              setState(() => floatingIcon = val);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildLanguageCard() {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Language",
                    style: GoogleFonts.poppins(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    selectedLanguage,
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _showLanguageSheet,
              child: Icon(Icons.edit, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String label, bool value, Function(bool) onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            activeTrackColor: AppColors.primary.withValues(alpha: 0.4),
            inactiveThumbColor: AppColors.primary,
            inactiveTrackColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            trackColor: WidgetStatePropertyAll(Colors.black12),
            thumbColor: WidgetStatePropertyAll(AppColors.primary,),
            overlayColor: WidgetStatePropertyAll(Colors.white),
          ),

        ],
      ),
    );
  }

  void _showLanguageSheet() {
    String tempSelected = selectedLanguage;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Language",
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 300.h,
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    String lang = languages[index];
                    return RadioListTile<String>(
                      title: Text(
                        lang,
                        style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black),
                      ),
                      value: lang,
                      groupValue: tempSelected,
                      onChanged: (value) {
                        setState(() {
                          tempSelected = value!;
                        });
                      },
                      activeColor: AppColors.primary,
                    );
                  },
                ),
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Cancel",
                      onTap: () => Navigator.pop(context),
                      bgcolor: Colors.grey.shade200,
                      color: AppColors.textPrimary,
                      border: true,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(
                      text: "Select",
                      onTap: () {
                        setState(() {
                          selectedLanguage = tempSelected;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
