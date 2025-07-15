import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:flutter/material.dart';

import 'varify_number_page.dart';
import 'widgets/base_form_page.dart';

class VarifyNumberOptionPage extends StatefulWidget {
  const VarifyNumberOptionPage({super.key});

  @override
  State<VarifyNumberOptionPage> createState() => _VarifyNumberOptionPageState();
}

class _VarifyNumberOptionPageState extends State<VarifyNumberOptionPage> {
  String selectedMethod = 'whatsapp';
  @override
  Widget build(BuildContext context) {
    return BaseFormPage(
      imagePath: "assets/images/icons/msg_varification_icon.jpeg",
      title: "Varify your mobile number",
      subtitle: "We need this to verify and secure your account",
      buttonText: "Send Code",
      onButtonTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => VarifyNumberPage()),
        );
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "How should we send your code?",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // WhatsApp Option
                RadioListTile(
                  value: 'whatsapp',
                  groupValue: selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value.toString();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      const Text(
                        "WhatsApp",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: AppWeights.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Preferred",
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.call),
                    ],
                  ),
                ),

                // Messaging Option
                RadioListTile(
                  value: 'sms',
                  groupValue: selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value.toString();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Messaging",
                    style: TextStyle(fontSize: 14, fontWeight: AppWeights.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
