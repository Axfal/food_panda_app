class MonthIncomeModel {
  final bool? success;
  final int? monthIncome;

  const MonthIncomeModel({this.success, this.monthIncome});

  factory MonthIncomeModel.fromJson(Map<String, dynamic> json) =>
      MonthIncomeModel(
        success: json['success'],
        monthIncome: json['month_income'],
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'month_income': monthIncome,
  };
}

class WeeklyIncomeModel {
  final bool? success;
  final int? weekIncome;

  const WeeklyIncomeModel({this.success, this.weekIncome});

  factory WeeklyIncomeModel.fromJson(Map<String, dynamic> json) =>
      WeeklyIncomeModel(
        success: json['success'],
        weekIncome: json['week_income'],
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'week_income': weekIncome,
  };
}

class TodayIncomeModel {
  final bool? success;
  final int? todayIncome;

  const TodayIncomeModel({this.success, this.todayIncome});

  factory TodayIncomeModel.fromJson(Map<String, dynamic> json) =>
      TodayIncomeModel(
        success: json['success'],
        todayIncome: json['today_income'],
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'today_income': todayIncome,
  };
}
