// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/repository/income/income_api_repository.dart';
import '../../model/income/income_model.dart';

part 'income_event.dart';
part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  final IncomeApiRepository incomeApiRepository;

  IncomeBloc({required this.incomeApiRepository}) : super(const IncomeState()) {
    on<FetchTodayIncomeEvent>(_onFetchTodayIncome);
    on<FetchWeeklyIncomeEvent>(_onFetchWeeklyIncome);
    on<FetchMonthlyIncomeEvent>(_onFetchMonthlyIncome);
  }

  Future<void> _onFetchTodayIncome(
      FetchTodayIncomeEvent event, Emitter<IncomeState> emit) async {
    emit(state.copyWith(apiResponse: const ApiResponse.loading()));

    final data = {
      "restaurant_id": event.restaurantId,
      "type": event.type,
    };

    try {
      final response = await incomeApiRepository.getIncome(data);

      if (response != null) {
        if (response['success'] == true && response['today_income'] != null) {
          final todayIncomeModel = TodayIncomeModel.fromJson(response);
          emit(state.copyWith(todayIncomeModel: todayIncomeModel));
          emit(state.copyWith(
              apiResponse:
              const ApiResponse.completed('Today income fetched successfully')));
        } else {
          emit(state.copyWith(apiResponse: ApiResponse.error(
              response['error'] ?? 'Error while fetching today income')));
        }
      } else {
        emit(state.copyWith(apiResponse: ApiResponse.error('No response from server')));
      }
    } catch (e) {
      print('error: $e');
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }

  Future<void> _onFetchWeeklyIncome(
      FetchWeeklyIncomeEvent event, Emitter<IncomeState> emit) async {
    emit(state.copyWith(apiResponse: const ApiResponse.loading()));

    final data = {
      "restaurant_id": event.restaurantId,
      "type": event.type,
    };

    try {
      final response = await incomeApiRepository.getIncome(data);

      if (response != null) {
        if (response['success'] == true && response['week_income'] != null) {
          final weeklyIncomeModel = WeeklyIncomeModel.fromJson(response);
          emit(state.copyWith(weeklyIncomeModel: weeklyIncomeModel));
          emit(state.copyWith(
              apiResponse:
              const ApiResponse.completed('Weekly income fetched successfully')));
        } else {
          emit(state.copyWith(apiResponse: ApiResponse.error(
              response['error'] ?? 'Error while fetching weekly income')));
        }
      } else {
        emit(state.copyWith(apiResponse: ApiResponse.error('No response from server')));
      }
    } catch (e) {
      print('error: $e');
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }

  Future<void> _onFetchMonthlyIncome(
      FetchMonthlyIncomeEvent event, Emitter<IncomeState> emit) async {
    emit(state.copyWith(apiResponse: const ApiResponse.loading()));

    final data = {
      "restaurant_id": event.restaurantId,
      "type": event.type,
    };

    try {
      final response = await incomeApiRepository.getIncome(data);

      if (response != null) {
        if (response['success'] == true && response['month_income'] != null) {
          final monthlyIncomeModel = MonthIncomeModel.fromJson(response);
          emit(state.copyWith(monthIncomeModel: monthlyIncomeModel));
          emit(state.copyWith(
              apiResponse:
              const ApiResponse.completed('Monthly income fetched successfully')));
        } else {
          emit(state.copyWith(apiResponse: ApiResponse.error(
              response['error'] ?? 'Error while fetching monthly income')));
        }
      } else {
        emit(state.copyWith(apiResponse: ApiResponse.error('No response from server')));
      }
    } catch (e) {
      print('error: $e');
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }
}
