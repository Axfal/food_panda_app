import 'package:excellent_trade_app/pages/home/home_exports.dart';


class PaymentMethodWidget extends StatefulWidget {
  final List<String> options;
  final Function(String) onOptionSelected;

  const PaymentMethodWidget({
    super.key,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    if (widget.options.isNotEmpty) {
      selectedOption = widget.options.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.wallet_outlined, color: Colors.black87),
                SizedBox(width: 10.w),
                Text(
                  'Payment Method',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            Divider(height: 24.h, thickness: 1, color: Colors.grey.shade200),
            ...widget.options.map((option) {
              final isActive = option == selectedOption;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary.withOpacity(0.1)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isActive ? AppColors.primary : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: () {
                        setState(() {
                          selectedOption = option;
                        });
                        widget.onOptionSelected(option);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              margin: EdgeInsets.only(right: 12.w),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.primary
                                    : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                option,
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: isActive
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isActive
                                      ? AppColors.primary
                                      : Colors.black87,
                                ),
                              ),
                            ),
                            if (option == "Pay Online (Currently disable)")
                              Icon(Icons.payment,
                                  color: isActive
                                      ? AppColors.primary
                                      : Colors.grey[600]),
                            if (option == "Cash on Delivery")
                              Icon(Icons.money,
                                  color: isActive
                                      ? AppColors.primary
                                      : Colors.grey[600]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
