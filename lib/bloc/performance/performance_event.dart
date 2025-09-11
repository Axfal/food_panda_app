part of 'performance_bloc.dart';

sealed class PerformanceEvent extends Equatable {
  const PerformanceEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchWeeklyPerformanceEvent extends PerformanceEvent {
  final String restaurantId;
  final String type;
  const FetchWeeklyPerformanceEvent({
    required this.restaurantId,
    required this.type,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [restaurantId, type];
}

class FetchMonthlyPerformanceEvent extends PerformanceEvent {
  final String restaurantId;
  final String type;
  const FetchMonthlyPerformanceEvent({
    required this.restaurantId,
    required this.type,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [restaurantId, type];
}

class FetchYearlyPerformanceEvent extends PerformanceEvent {
  final String restaurantId;
  final String type;
  const FetchYearlyPerformanceEvent({
    required this.restaurantId,
    required this.type,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [restaurantId, type];
}
