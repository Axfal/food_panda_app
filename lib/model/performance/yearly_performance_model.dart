class YearlyPerformanceModel {
  bool? success;
  List<YearlyPerformance>? yearlyPerformance;

  YearlyPerformanceModel({this.success, this.yearlyPerformance});

  YearlyPerformanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['yearly_performance'] != null) {
      yearlyPerformance = <YearlyPerformance>[];
      json['yearly_performance'].forEach((v) {
        yearlyPerformance!.add(new YearlyPerformance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.yearlyPerformance != null) {
      data['yearly_performance'] =
          this.yearlyPerformance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class YearlyPerformance {
  String? month;
  String? income;

  YearlyPerformance({this.month, this.income});

  YearlyPerformance.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    income = json['income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['income'] = this.income;
    return data;
  }
}
