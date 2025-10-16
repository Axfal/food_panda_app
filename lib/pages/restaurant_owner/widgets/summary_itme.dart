import '../restaurant_owner_exports.dart';

class SummaryItem extends StatelessWidget {
  final String title;
  final String value;
  final Color circleColor;
  final List<Color> gradientColors;

  const SummaryItem({
    super.key,
    required this.title,
    required this.value,
    required this.circleColor,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circular income indicator
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: gradientColors.last.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: circleColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.black.withValues(alpha: 0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
