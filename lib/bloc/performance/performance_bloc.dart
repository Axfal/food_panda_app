// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/performance/monthly_performance_model.dart';
import 'package:excellent_trade_app/model/performance/weekly_performance_model.dart';
import 'package:excellent_trade_app/model/performance/yearly_performance_model.dart';
import '../../repository/performance/performance_api_repo.dart';

part 'performance_event.dart';
part 'performance_state.dart';

class PerformanceBloc extends Bloc<PerformanceEvent, PerformanceState> {
  final PerformanceApiRepository performanceApiRepository;

  PerformanceBloc({required this.performanceApiRepository})
    : super(PerformanceState()) {
    on<FetchWeeklyPerformanceEvent>(_onFetchWeeklyPerformance);
    on<FetchMonthlyPerformanceEvent>(_onFetchMonthlyPerformance);
    on<FetchYearlyPerformanceEvent>(_onFetchYearlyPerformance);
  }

  Future<void> _onFetchWeeklyPerformance(
    FetchWeeklyPerformanceEvent event,
    Emitter<PerformanceState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = {'restaurant_id': event.restaurantId, 'type': event.type};

    try {
      final response = await performanceApiRepository.getPerformance(data);

      if (response == null) {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error('No response from server'),
          ),
        );
        return;
      }

      if (response['success'] == true &&
          response['weekly_performance'] != null) {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.completed('data fetched successfully'),
            weeklyPerformance: WeeklyPerformanceModel.fromJson(response),
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error(
              response['error'] ?? 'Error while fetching weekly performance',
            ),
          ),
        );
      }
    } catch (e, stack) {
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error('Exception: ${e.toString()}'),
        ),
      );
      print('Error in _onFetchWeeklyPerformance: $e\n$stack');
    }
  }

  Future<void> _onFetchMonthlyPerformance(
    FetchMonthlyPerformanceEvent event,
    Emitter<PerformanceState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = {'restaurant_id': event.restaurantId, 'type': event.type};

    try {
      final response = await performanceApiRepository.getPerformance(data);

      if (response == null) {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error('No response from server'),
          ),
        );
        return;
      }

      if (response['success'] == true &&
          response['monthly_performance'] != null) {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.completed('data fetch successfully'),
            monthlyPerformance: MonthlyPerformanceModel.fromJson(response),
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error(
              response['error'] ?? 'Error while fetching monthly performance',
            ),
          ),
        );
      }
    } catch (e, stack) {
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error('Exception: ${e.toString()}'),
        ),
      );
      print('Error in _onFetchMonthlyPerformance: $e\n$stack');
    }
  }

  Future<void> _onFetchYearlyPerformance(
    FetchYearlyPerformanceEvent event,
    Emitter<PerformanceState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = {'restaurant_id': event.restaurantId, 'type': event.type};

    try {
      final response = await performanceApiRepository.getPerformance(data);

      if (response == null) {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error('No response from server'),
          ),
        );
        return;
      }

      if (response['success'] == true &&
          response['yearly_performance'] != null) {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.completed('data fetched successfully'),
            yearlyPerformance: YearlyPerformanceModel.fromJson(response),
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error(
              response['error'] ?? 'Error while fetching yearly performance',
            ),
          ),
        );
      }
    } catch (e, stack) {
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error('Exception: ${e.toString()}'),
        ),
      );
      print('Error in _onFetchYearlyPerformance: $e\n$stack');
    }
  }
}
