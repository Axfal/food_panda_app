class MonthlyPerformanceModel {
  final bool? success;
  final MonthlyPerformanceData? monthlyPerformance;

  const MonthlyPerformanceModel({
    this.success,
    this.monthlyPerformance,
  });

  factory MonthlyPerformanceModel.fromJson(Map<String, dynamic> json) {
    return MonthlyPerformanceModel(
      success: json['success'] as bool?,
      monthlyPerformance: json['monthly_performance'] != null
          ? MonthlyPerformanceData.fromJson(
          json['monthly_performance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'monthly_performance': monthlyPerformance?.toJson(),
  };
}

class MonthlyPerformanceData {
  final List<MonthlyBreakdown>? breakdown;
  final MonthlyTotals? totals;

  const MonthlyPerformanceData({
    this.breakdown,
    this.totals,
  });

  factory MonthlyPerformanceData.fromJson(Map<String, dynamic> json) {
    return MonthlyPerformanceData(
      breakdown: (json['breakdown'] as List?)
          ?.map((v) => MonthlyBreakdown.fromJson(v as Map<String, dynamic>))
          .toList(),
      totals: json['totals'] != null
          ? MonthlyTotals.fromJson(json['totals'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'breakdown': breakdown?.map((v) => v.toJson()).toList(),
    'totals': totals?.toJson(),
  };
}

class MonthlyBreakdown {
  final int? day;
  final String? income;
  final int? totalOrders;
  final String? avgOrder;

  const MonthlyBreakdown({
    this.day,
    this.income,
    this.totalOrders,
    this.avgOrder,
  });

  factory MonthlyBreakdown.fromJson(Map<String, dynamic> json) {
    return MonthlyBreakdown(
      day: json['day'] as int?,
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

class MonthlyTotals {
  final String? totalIncome;
  final int? totalOrders;
  final String? avgOrder;

  const MonthlyTotals({
    this.totalIncome,
    this.totalOrders,
    this.avgOrder,
  });

  factory MonthlyTotals.fromJson(Map<String, dynamic> json) {
    return MonthlyTotals(
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
