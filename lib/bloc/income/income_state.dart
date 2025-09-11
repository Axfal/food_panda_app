part of 'income_bloc.dart';

class IncomeState extends Equatable {
  final ApiResponse<String> apiResponse;
  final TodayIncomeModel todayIncomeModel;
  final WeeklyIncomeModel weeklyIncomeModel;
  final MonthIncomeModel monthIncomeModel;

  const IncomeState({
    this.apiResponse = const ApiResponse.completed(''),
    this.todayIncomeModel = const TodayIncomeModel(),
    this.weeklyIncomeModel = const WeeklyIncomeModel(),
    this.monthIncomeModel = const MonthIncomeModel(),
  });

  IncomeState copyWith({
    ApiResponse<String>? apiResponse,
    TodayIncomeModel? todayIncomeModel,
    WeeklyIncomeModel? weeklyIncomeModel,
    MonthIncomeModel? monthIncomeModel,
  }) {
    return IncomeState(
      apiResponse: apiResponse ?? this.apiResponse,
      todayIncomeModel: todayIncomeModel ?? this.todayIncomeModel,
      weeklyIncomeModel: weeklyIncomeModel ?? this.weeklyIncomeModel,
      monthIncomeModel: monthIncomeModel ?? this.monthIncomeModel,
    );
  }

  @override
  List<Object> get props => [
    apiResponse,
    todayIncomeModel,
    weeklyIncomeModel,
    monthIncomeModel,
  ];
}
