part of 'income_bloc.dart';

sealed class IncomeEvent extends Equatable {
  const IncomeEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchTodayIncomeEvent extends IncomeEvent {
  final String restaurantId;
  final String type;
  const FetchTodayIncomeEvent({required this.restaurantId, required this.type});
  @override
  // TODO: implement props
  List<Object?> get props => [restaurantId, type];
}

class FetchWeeklyIncomeEvent extends IncomeEvent {
  final String restaurantId;
  final String type;
  const FetchWeeklyIncomeEvent({
    required this.restaurantId,
    required this.type,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [restaurantId, type];
}

class FetchMonthlyIncomeEvent extends IncomeEvent {
  final String restaurantId;
  final String type;
  const FetchMonthlyIncomeEvent({
    required this.restaurantId,
    required this.type,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [restaurantId, type];
}
