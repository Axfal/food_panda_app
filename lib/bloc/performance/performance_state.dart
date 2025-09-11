part of 'performance_bloc.dart';

class PerformanceState extends Equatable {
  final ApiResponse<String> apiResponse;
  final WeeklyPerformanceModel weeklyPerformance;
  final MonthlyPerformanceModel monthlyPerformance;
  final YearlyPerformanceModel yearlyPerformance;

  const PerformanceState({
    this.apiResponse = const ApiResponse.completed(''),
    this.weeklyPerformance = const WeeklyPerformanceModel(),
    this.monthlyPerformance = const MonthlyPerformanceModel(),
    this.yearlyPerformance = const YearlyPerformanceModel(),
  });

  PerformanceState copyWith({
    ApiResponse<String>? apiResponse,
    WeeklyPerformanceModel? weeklyPerformance,
    MonthlyPerformanceModel? monthlyPerformance,
    YearlyPerformanceModel? yearlyPerformance,
  }) {
    return PerformanceState(
      apiResponse: apiResponse ?? this.apiResponse,
      weeklyPerformance: weeklyPerformance ?? this.weeklyPerformance,
      monthlyPerformance: monthlyPerformance ?? this.monthlyPerformance,
      yearlyPerformance: yearlyPerformance ?? this.yearlyPerformance,
    );
  }

  @override
  List<Object?> get props => [
    apiResponse,
    weeklyPerformance,
    monthlyPerformance,
    yearlyPerformance,
  ];
}
