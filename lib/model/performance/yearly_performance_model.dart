class YearlyPerformanceModel {
  final bool? success;
  final YearlyPerformanceData? yearlyPerformance;

  const YearlyPerformanceModel({
    this.success,
    this.yearlyPerformance,
  });

  factory YearlyPerformanceModel.fromJson(Map<String, dynamic> json) {
    return YearlyPerformanceModel(
      success: json['success'] as bool?,
      yearlyPerformance: json['yearly_performance'] != null
          ? YearlyPerformanceData.fromJson(
          json['yearly_performance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'yearly_performance': yearlyPerformance?.toJson(),
  };
}

class YearlyPerformanceData {
  final List<Breakdown>? breakdown;
  final Totals? totals;

  const YearlyPerformanceData({
    this.breakdown,
    this.totals,
  });

  factory YearlyPerformanceData.fromJson(Map<String, dynamic> json) {
    return YearlyPerformanceData(
      breakdown: (json['breakdown'] as List?)
          ?.map((v) => Breakdown.fromJson(v as Map<String, dynamic>))
          .toList(),
      totals: json['totals'] != null
          ? Totals.fromJson(json['totals'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'breakdown': breakdown?.map((v) => v.toJson()).toList(),
    'totals': totals?.toJson(),
  };
}

class Breakdown {
  final String? month;
  final String? income;
  final int? totalOrders;
  final String? avgOrder;

  const Breakdown({
    this.month,
    this.income,
    this.totalOrders,
    this.avgOrder,
  });

  factory Breakdown.fromJson(Map<String, dynamic> json) {
    return Breakdown(
      month: json['month'] as String?,
      income: json['income'] as String?,
      totalOrders: json['total_orders'] as int?,
      avgOrder: json['avg_order'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'month': month,
    'income': income,
    'total_orders': totalOrders,
    'avg_order': avgOrder,
  };
}

class Totals {
  final String? totalIncome;
  final int? totalOrders;
  final String? avgOrder;

  const Totals({
    this.totalIncome,
    this.totalOrders,
    this.avgOrder,
  });

  factory Totals.fromJson(Map<String, dynamic> json) {
    return Totals(
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
