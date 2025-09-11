class WeeklyPerformanceModel {
  bool? success;
  List<WeeklyPerformance>? weeklyPerformance;

  WeeklyPerformanceModel({this.success, this.weeklyPerformance});

  WeeklyPerformanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['weekly_performance'] != null) {
      weeklyPerformance = <WeeklyPerformance>[];
      json['weekly_performance'].forEach((v) {
        weeklyPerformance!.add(new WeeklyPerformance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.weeklyPerformance != null) {
      data['weekly_performance'] =
          this.weeklyPerformance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeeklyPerformance {
  String? day;
  String? income;

  WeeklyPerformance({this.day, this.income});

  WeeklyPerformance.fromJson(Map<String, dynamic> json) {
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
