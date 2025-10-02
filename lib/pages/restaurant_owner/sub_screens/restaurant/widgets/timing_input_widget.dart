import '../restaurant_exports.dart';

class TimingInputWidget extends StatefulWidget {
  final String? id;
  final String? timing; // Expected format: "09:00 am to 05:00 pm"
  const TimingInputWidget({super.key, this.timing, this.id});

  @override
  State<TimingInputWidget> createState() => _TimingInputWidgetState();
}

class _TimingInputWidgetState extends State<TimingInputWidget> {
  TimeOfDay? _fromTime;
  TimeOfDay? _toTime;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<RestaurantBloc>();
    _parseTiming(bloc.state.hours);

    context.read<RestaurantBloc>().add(
      HoursChangeEvent(hours: _formatFullTiming(), id: "6" ?? ''),
    );
  }

  void _parseTiming(String? timing) {
    try {
      if (timing == null || timing.isEmpty) throw Exception("Empty timing");
      final parts = timing.split(' to ');
      if (parts.length != 2) throw Exception("Invalid format");
      _fromTime = _parseTime(parts[0]);
      _toTime = _parseTime(parts[1]);
    } catch (_) {
      _fromTime = const TimeOfDay(hour: 0, minute: 0);
      _toTime = const TimeOfDay(hour: 0, minute: 0);
    }
  }

  /// Converts "09:00 am" -> TimeOfDay
  TimeOfDay _parseTime(String timeStr) {
    final lower = timeStr.toLowerCase().trim();
    if (!lower.contains('am') && !lower.contains('pm')) {
      throw Exception("Missing AM/PM");
    }
    final isPM = lower.contains('pm');
    final clean = lower.replaceAll(RegExp(r'[^\d:]'), '');
    final hourMin = clean.split(':');
    if (hourMin.isEmpty) throw Exception("No hour part");

    int hour = int.tryParse(hourMin[0]) ?? 0;
    final minute = hourMin.length > 1 ? int.tryParse(hourMin[1]) ?? 0 : 0;

    if (hour < 0 || hour > 12 || minute < 0 || minute > 59) {
      throw Exception("Invalid time numbers");
    }

    if (isPM && hour < 12) hour += 12;
    if (!isPM && hour == 12) hour = 0;

    return TimeOfDay(hour: hour, minute: minute);
  }

  /// Converts TimeOfDay -> "hh:mm am"
  String _formatSingleTime(TimeOfDay? time) {
    if (time == null) return "12:00 am";
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "am" : "pm";
    return "${hour.toString().padLeft(2, '0')}:$minute $period";
  }

  /// Full formatted string: "hh:mm am to hh:mm pm"
  String _formatFullTiming() {
    return "${_formatSingleTime(_fromTime)} to ${_formatSingleTime(_toTime)}";
  }

  Future<void> _selectTime(BuildContext context, bool isFrom) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isFrom
          ? (_fromTime ?? const TimeOfDay(hour: 0, minute: 0))
          : (_toTime ?? const TimeOfDay(hour: 0, minute: 0)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white,
              hourMinuteColor: AppColors.primary,
              hourMinuteTextColor: Colors.white,
              dayPeriodColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.primary;
                }
                return Colors.grey.shade200;
              }),
              dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.white;
                }
                return Colors.black87;
              }),
              dialBackgroundColor: Colors.grey.shade200,
              dialHandColor: AppColors.primary,
              entryModeIconColor: AppColors.primary,
            ),
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && mounted) {
      setState(() {
        if (isFrom) {
          _fromTime = picked;
        } else {
          _toTime = picked;
        }
      });
      context.read<RestaurantBloc>().add(
        HoursChangeEvent(hours: _formatFullTiming(), id: widget.id ?? ''),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        children: [
          // From Time Field
          Expanded(
            child: InkWell(
              onTap: () => _selectTime(context, true),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Opens At",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _formatSingleTime(_fromTime),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // To Time Field
          Expanded(
            child: InkWell(
              onTap: () => _selectTime(context, false),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Closes At",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _formatSingleTime(_toTime),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
