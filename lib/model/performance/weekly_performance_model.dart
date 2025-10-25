class WeeklyPerformanceModel {
  final bool? success;
  final WeeklyPerformanceData? weeklyPerformance;

  const WeeklyPerformanceModel({this.success, this.weeklyPerformance});

  factory WeeklyPerformanceModel.fromJson(Map<String, dynamic> json) {
    return WeeklyPerformanceModel(
      success: json['success'] as bool?,
      weeklyPerformance: json['weekly_performance'] != null
          ? WeeklyPerformanceData.fromJson(
              json['weekly_performance'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'weekly_performance': weeklyPerformance?.toJson(),
  };
}

class WeeklyPerformanceData {
  final List<WeeklyBreakdown>? breakdown;
  final WeeklyTotals? totals;

  const WeeklyPerformanceData({this.breakdown, this.totals});

  factory WeeklyPerformanceData.fromJson(Map<String, dynamic> json) {
    return WeeklyPerformanceData(
      breakdown: (json['breakdown'] as List?)
          ?.map((v) => WeeklyBreakdown.fromJson(v as Map<String, dynamic>))
          .toList(),
      totals: json['totals'] != null
          ? WeeklyTotals.fromJson(json['totals'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'breakdown': breakdown?.map((v) => v.toJson()).toList(),
    'totals': totals?.toJson(),
  };
}

class WeeklyBreakdown {
  final String? day;
  final String? income;
  final int? totalOrders;
  final String? avgOrder;

  const WeeklyBreakdown({
    this.day,
    this.income,
    this.totalOrders,
    this.avgOrder,
  });

  factory WeeklyBreakdown.fromJson(Map<String, dynamic> json) {
    return WeeklyBreakdown(
      day: json['day'] as String?,
      income: json['income'] as String?,
      totalOrders: json['total_orders'] as int?,
      avgOrder: json['avg_order'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'day': day,
    'income': income,
    'total_orders': totalOrders,
    'avg_order': avgOrder,
  };
}

class WeeklyTotals {
  final String? totalIncome;
  final int? totalOrders;
  final String? avgOrder;

  const WeeklyTotals({this.totalIncome, this.totalOrders, this.avgOrder});

  factory WeeklyTotals.fromJson(Map<String, dynamic> json) {
    return WeeklyTotals(
      totalIncome: json['total_income'] as String?,
      totalOrders: json['total_orders'] as int?,
      avgOrder: json['avg_order'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'total_income': totalIncome,
    'total_orders': totalOrders,
    'avg_order': avgOrder,
  };
}
