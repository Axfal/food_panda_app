class WeeklyPerformanceModel {
  final bool? success;
  final List<WeeklyPerformance>? weeklyPerformance;

  const WeeklyPerformanceModel({
    this.success,
    this.weeklyPerformance,
  });

  factory WeeklyPerformanceModel.fromJson(Map<String, dynamic> json) {
    return WeeklyPerformanceModel(
      success: json['success'] as bool?,
      weeklyPerformance: (json['weekly_performance'] as List?)
          ?.map((v) => WeeklyPerformance.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'weekly_performance':
    weeklyPerformance?.map((v) => v.toJson()).toList(),
  };
}

class WeeklyPerformance {
  final String? day;
  final String? income;

  const WeeklyPerformance({
    this.day,
    this.income,
  });

  factory WeeklyPerformance.fromJson(Map<String, dynamic> json) {
    return WeeklyPerformance(
      day: json['day'] as String?,
      income: json['income'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'day': day,
    'income': income,
  };
}
