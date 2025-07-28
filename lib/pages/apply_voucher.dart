import 'package:excellent_trade_app/utils/constants/app_colors.dart';
import 'package:excellent_trade_app/config/components/custom_text_field.dart';
import 'package:excellent_trade_app/config/components/round_button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ApplyVoucher extends StatefulWidget {
  const ApplyVoucher({super.key});

  @override
  State<ApplyVoucher> createState() => _ApplyVoucherState();
}

class _ApplyVoucherState extends State<ApplyVoucher> {
  final voucherController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              CustomTextField(
                label: 'Enter a voucher code',
                hintText: 'Enter a voucher code',
                controller: voucherController,
                focusNode: focusNode,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 16),
              RoundButton(title: 'Apply', onPress: () {}),

              Container(
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Select a voucher',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              voucherWidget(
                icon: Icons.attach_money,
                title: 'Get Rs. 500 cashback via Food Bazaar',
                discount: '10',
                code: 'GIFTCARD500',
                rupees: '1200',
                date: '31 Jul 2025',
                apply: () {},
              ),
              voucherWidget(
                icon: Icons.attach_money,
                title: 'Get Rs. 500 cashback via Food Bazaar',
                discount: '10',
                code: 'GIFTCARD501',
                rupees: '1200',
                date: '01 Aug 2025',
                apply: () {},
              ),
              voucherWidget(
                icon: Icons.attach_money,
                title: 'Get Rs. 500 cashback via Food Bazaar',
                discount: '12',
                code: 'GIFTCARD502',
                rupees: '900',
                date: '02 Aug 2025',
                apply: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget voucherWidget({
    required IconData icon,
    required String title,
    required String discount,
    required String code,
    required String rupees,
    required String date,
    required VoidCallback apply,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                child: Icon(
                  Icons.attach_money,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '$discount% back',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 5),
              Icon(Icons.info_outline, size: 14, color: AppColors.primary),
              const SizedBox(width: 5),
              Text(
                code,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Min spend Rs. $rupees\t - \t $date',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () => apply,
                child: Text(
                  'Apply',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      title: Text(
        'Apply a voucher',
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }
}
