import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../Utils/constants/appWeight.dart';
import '../../../Utils/constants/app_colors.dart';

class ResHeaader extends StatefulWidget {
  final String title;
  final double rating;
  final int reviewsCount;
  final String duration;
  final int deliveryFee;
  final int deliveryFeeWithSaver;
  final int minOrder;
  final Map<String, dynamic>? discount;
  final Map<String, dynamic>? voucher;

  const ResHeaader({
    super.key,
    required this.title,
    required this.rating,
    required this.reviewsCount,
    required this.duration,
    required this.deliveryFee,
    required this.deliveryFeeWithSaver,
    required this.minOrder,
    this.discount,
    this.voucher,
  });

  @override
  State<ResHeaader> createState() => _ResHeaaderState();
}

class _ResHeaaderState extends State<ResHeaader> {
  bool isBike = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: AppWeights.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // dynamically generate full stars
            ...List.generate(
              widget.rating.floor(),
              (index) => Icon(Icons.star, color: Colors.orange, size: 12),
            ),
            // show half star if needed
            if (widget.rating - widget.rating.floor() >= 0.5)
              Icon(Icons.star_half, color: Colors.orange, size: 12),
            SizedBox(width: 4),
            Text(
              '${widget.rating}',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              ' (${widget.reviewsCount}+ ratings)',
              style: TextStyle(fontSize: 12, fontWeight: AppWeights.bold),
            ),
          ],
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.textSecondary.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ToggleSwitch(
                    minWidth: 40,
                    minHeight: 30,
                    cornerRadius: 20,
                    radiusStyle: true,

                    activeBgColors: [
                      [Colors.white],
                      [Colors.white],
                    ],
                    activeFgColor: AppColors.black,
                    inactiveBgColor: Colors.grey.shade300,
                    inactiveFgColor: Colors.grey,
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    icons: [Icons.pedal_bike, Icons.directions_walk],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Delivery ${widget.duration}",
                              style: TextStyle(fontWeight: AppWeights.bold),
                            ),
                            Spacer(),
                            Text(
                              "Change",
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Rs. ${widget.deliveryFee} delivery or Rs. ${widget.deliveryFeeWithSaver} with Saver • Min. order Rs. ${widget.minOrder}",
                          style: TextStyle(color: AppColors.textSecondary),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: IntrinsicHeight(
            child: Row(
              children: [
                if (widget.discount != null &&
                    (widget.voucher?['acceptsVoucher'] ?? false)) ...[
                  Expanded(child: _buildDiscountCard()),
                  SizedBox(width: 5),
                  Expanded(child: _buildVoucherCard()),
                ] else if (widget.discount != null) ...[
                  Expanded(child: _buildDiscountCard()),
                ] else if (widget.voucher?['acceptsVoucher'] ?? false) ...[
                  Expanded(child: _buildVoucherCard()),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiscountCard() {
    return Card(
      color: AppColors.lightPink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 3,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  padding: EdgeInsets.all(3),
                  child: Icon(Icons.percent, size: 10, color: Colors.white),
                ),

                if (widget.discount?['title'] != null)
                  Text(
                    widget.discount!['title'],
                    style: TextStyle(fontWeight: AppWeights.bold),
                    maxLines: 2,
                  ),
              ],
            ),
            if (widget.discount?['description'] != null)
              Text(
                widget.discount!['description'],
                style: TextStyle(color: AppColors.textSecondary),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoucherCard() {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.textSecondary.withOpacity(0.3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.attach_money, color: AppColors.primary, size: 15),

                  if (widget.voucher?['title'] != null)
                    Text(
                      widget.voucher!['title'],
                      style: TextStyle(fontWeight: AppWeights.bold),
                    ),
                ],
              ),
              if (widget.voucher?['description'] != null)
                Text(
                  widget.voucher!['description'],
                  style: TextStyle(color: AppColors.textSecondary),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
