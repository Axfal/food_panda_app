import 'package:excellent_trade_app/pages/home/home_exports.dart';

class DeliveryOptionWidget extends StatefulWidget {
  final List<DeliveryOption> options;
  final Function(DeliveryOption) onOptionSelected;

  const DeliveryOptionWidget({
    super.key,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  State<DeliveryOptionWidget> createState() => _DeliveryOptionWidgetState();
}

class _DeliveryOptionWidgetState extends State<DeliveryOptionWidget> {
  DeliveryOption? selectedOption;

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
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Option',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            ...widget.options.map((option) {
              final isActive = option == selectedOption;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary.withValues(alpha: .098)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isActive ? AppColors.primary : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          selectedOption = option;
                        });
                        widget.onOptionSelected(option);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.primary
                                    : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                option.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: isActive
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isActive
                                      ? AppColors.primary
                                      : Colors.black87,
                                ),
                              ),
                            ),
                            Text(
                              option.time,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: isActive
                                    ? AppColors.primary
                                    : Colors.grey[600],
                              ),
                            ),
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

class DeliveryOption {
  final String title;
  final String time;

  DeliveryOption({required this.title, required this.time});
}
