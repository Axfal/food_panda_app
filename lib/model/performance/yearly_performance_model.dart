class YearlyPerformanceModel {
  final bool? success;
  final List<YearlyPerformance>? yearlyPerformance;

  const YearlyPerformanceModel({
    this.success,
    this.yearlyPerformance,
  });

  factory YearlyPerformanceModel.fromJson(Map<String, dynamic> json) {
    return YearlyPerformanceModel(
      success: json['success'] as bool?,
      yearlyPerformance: (json['yearly_performance'] as List?)
          ?.map((v) => YearlyPerformance.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'yearly_performance':
    yearlyPerformance?.map((v) => v.toJson()).toList(),
  };
}

class YearlyPerformance {
  final String? month;
  final String? income;

  const YearlyPerformance({
    this.month,
    this.income,
  });

  factory YearlyPerformance.fromJson(Map<String, dynamic> json) {
    return YearlyPerformance(
      month: json['month'] as String?,
      income: json['income'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'month': month,
    'income': income,
  };
}
