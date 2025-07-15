import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/customeButtons.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = 'English';
  bool push_notification = false;
  bool offers_by_email = false;
  bool floating_icon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
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
                  "Settings",
                  style: TextStyle(
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

        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 5,
            children: [
              Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Language",
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: _showLanguageSheet,
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          selectedLanguage,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.textPrimary,
                            fontWeight: AppWeights.extraBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildCheckBoxRow(
                "Receive push notification",
                push_notification,
                (val) {
                  setState(() => push_notification = val);
                },
              ),
              _buildCheckBoxRow("Receive offers by email", offers_by_email, (
                val,
              ) {
                setState(() => offers_by_email = val);
              }),
              _buildCheckBoxRow("Show floating icons", floating_icon, (val) {
                setState(() => floating_icon = val);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckBoxRow(String label, bool value, Function(bool) onChanged) {
    return Card(
      color: AppColors.white,
      child: CheckboxListTile(
        value: value,
        onChanged: (val) {
          onChanged(val!);
        },
        title: Text(label, style: TextStyle(fontSize: 15)),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

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

  void _showLanguageSheet() {
    String tempSelected = selectedLanguage;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Language',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height:
                        250, // Limits height so it doesn't cover whole screen
                    child: ListView.builder(
                      itemCount: languages.length,
                      itemBuilder: (context, index) {
                        final language = languages[index];
                        return RadioListTile<String>(
                          title: Text(language, style: TextStyle(fontSize: 15)),
                          value: language,
                          groupValue: tempSelected,
                          onChanged: (value) {
                            setModalState(() {
                              tempSelected = value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "Cancel",
                            onTap: () => Navigator.pop(context),
                            bgcolor: AppColors.white,
                            color: AppColors.black,
                            border: true,
                          ),
                        ),
                        SizedBox(width: 5),
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
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
