class MonthlyPerformanceModel {
  bool? success;
  List<MonthlyPerformance>? monthlyPerformance;

  MonthlyPerformanceModel({this.success, this.monthlyPerformance});

  MonthlyPerformanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['monthly_performance'] != null) {
      monthlyPerformance = <MonthlyPerformance>[];
      json['monthly_performance'].forEach((v) {
        monthlyPerformance!.add(new MonthlyPerformance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.monthlyPerformance != null) {
      data['monthly_performance'] =
          this.monthlyPerformance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthlyPerformance {
  int? day;
  String? income;

  MonthlyPerformance({this.day, this.income});

  MonthlyPerformance.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    income = json['income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['income'] = this.income;
    return data;
  }
}
