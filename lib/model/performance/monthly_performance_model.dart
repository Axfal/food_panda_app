class MonthlyPerformanceModel {
  final bool? success;
  final List<MonthlyPerformance>? monthlyPerformance;

  const MonthlyPerformanceModel({
    this.success,
    this.monthlyPerformance,
  });

  factory MonthlyPerformanceModel.fromJson(Map<String, dynamic> json) {
    return MonthlyPerformanceModel(
      success: json['success'] as bool?,
      monthlyPerformance: (json['monthly_performance'] as List?)
          ?.map((v) => MonthlyPerformance.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'monthly_performance':
    monthlyPerformance?.map((v) => v.toJson()).toList(),
  };
}

class MonthlyPerformance {
  final int? day;
  final String? income;

  const MonthlyPerformance({
    this.day,
    this.income,
  });

  factory MonthlyPerformance.fromJson(Map<String, dynamic> json) {
    return MonthlyPerformance(
      day: json['day'] as int?,
      income: json['income'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'day': day,
    'income': income,
  };
}
