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

    final data = {
      'restaurant_id': event.restaurantId,
      'type': event.type,
    };

    try {
      final response = await performanceApiRepository.getPerformance(data);

      if (response == null) {
        emit(state.copyWith(
          apiResponse: ApiResponse.error('No response from server'),
        ));
        return;
      }

      if (response['success'] == true && response['weekly_performance'] != null) {
        dynamic dato = {
          "success": true,
          "weekly_performance": {
            "breakdown": [
              {
                "day": "Tuesday",
                "income": "400.00",
                "total_orders": 1,
                "avg_order": "110.00"
              },
              {
                "day": "Wednesday",
                "income": "400.00",
                "total_orders": 1,
                "avg_order": "400.00"
              },
              {
                "day": "Friday",
                "income": "570.00",
                "total_orders": 1,
                "avg_order": "400.00"
              },
              {
                "day": "Friday",
                "income": "870.00",
                "total_orders": 1,
                "avg_order": "400.00"
              },
              {
                "day": "Friday",
                "income": "1570.00",
                "total_orders": 1,
                "avg_order": "400.00"
              },
              {
                "day": "Friday",
                "income": "970.00",
                "total_orders": 1,
                "avg_order": "400.00"
              }
            ],
            "totals": {
              "total_income": "1200.00",
              "total_orders": 3,
              "avg_order": "400.00"
            }
          }
        };
        emit(state.copyWith(
          apiResponse: ApiResponse.completed('data fetched successfully'),
          weeklyPerformance: WeeklyPerformanceModel.fromJson(dato),
        ));
      } else {
        emit(state.copyWith(
          apiResponse: ApiResponse.error(
            response['error'] ?? 'Error while fetching weekly performance',
          ),
        ));
      }
    } catch (e, stack) {
      emit(state.copyWith(
        apiResponse: ApiResponse.error('Exception: ${e.toString()}'),
      ));
      print('Error in _onFetchWeeklyPerformance: $e\n$stack');
    }
  }

  Future<void> _onFetchMonthlyPerformance(
      FetchMonthlyPerformanceEvent event,
      Emitter<PerformanceState> emit,
      ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = {
      'restaurant_id': event.restaurantId,
      'type': event.type,
    };

    try {
      final response = await performanceApiRepository.getPerformance(data);

      if (response == null) {
        emit(state.copyWith(
          apiResponse: ApiResponse.error('No response from server'),
        ));
        return;
      }

      dynamic dato ={
        "success": true,
        "monthly_performance": {
          "breakdown": [
            {
              "day": 5,
              "income": "400.00",
              "total_orders": 1,
              "avg_order": "400.00"
            },
            {
              "day": 9,
              "income": "400.00",
              "total_orders": 1,
              "avg_order": "600.00"
            }, {
              "day": 9,
              "income": "400.00",
              "total_orders": 1,
              "avg_order": "900.00"
            }, {
              "day": 9,
              "income": "400.00",
              "total_orders": 1,
              "avg_order": "100.00"
            }, {
              "day": 9,
              "income": "400.00",
              "total_orders": 1,
              "avg_order": "500.00"
            }, {
              "day": 9,
              "income": "400.00",
              "total_orders": 1,
              "avg_order": "900.00"
            }, {
              "day": 9,
              "income": "400.00",
              "total_orders": 1,
              "avg_order": "200.00"
            },
            {
              "day": 10,
              "income": "400.00",
              "total_orders": 1,
              "avg_order": "100.00"
            },
            {
              "day": 12,
              "income": "1400.00",
              "total_orders": 1,
              "avg_order": "400.00"
            }
          ],
          "totals": {
            "total_income": "1600.00",
            "total_orders": 4,
            "avg_order": "400.00"
          }
        }
      };

      if (response['success'] == true && response['monthly_performance'] != null) {
        emit(state.copyWith(
          apiResponse: ApiResponse.completed('data fetch successfully'),
          monthlyPerformance: MonthlyPerformanceModel.fromJson(dato),
        ));
      } else {
        emit(state.copyWith(
          apiResponse: ApiResponse.error(
            response['error'] ?? 'Error while fetchinged monthly performance',
          ),
        ));
      }
    } catch (e, stack) {
      emit(state.copyWith(
        apiResponse: ApiResponse.error('Exception: ${e.toString()}'),
      ));
      print('Error in _onFetchMonthlyPerformance: $e\n$stack');
    }
  }

  Future<void> _onFetchYearlyPerformance(
      FetchYearlyPerformanceEvent event,
      Emitter<PerformanceState> emit,
      ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = {
      'restaurant_id': event.restaurantId,
      'type': event.type,
    };

    try {
      final response = await performanceApiRepository.getPerformance(data);

      if (response == null) {
        emit(state.copyWith(
          apiResponse: ApiResponse.error('No response from server'),
        ));
        return;
      }

      dynamic dato = {
        "success": true,
        "yearly_performance": {
          "breakdown": [
            {
              "month": "September",
              "income": "16000.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },{
              "month": "September",
              "income": "1600.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },{
              "month": "September",
              "income": "2600.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },{
              "month": "September",
              "income": "3600.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },{
              "month": "September",
              "income": "4600.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },{
              "month": "September",
              "income": "4900.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },{
              "month": "September",
              "income": "3600.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },{
              "month": "September",
              "income": "6600.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },{
              "month": "September",
              "income": "2600.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },{
              "month": "September",
              "income": "4600.00",
              "total_orders": 4,
              "avg_order": "400.00"
            },
          ],
          "totals": {
            "total_income": "1600.00",
            "total_orders": 4,
            "avg_order": "400.00"
          }
        }
      };

      if (response['success'] == true && response['yearly_performance'] != null) {
        emit(state.copyWith(
          apiResponse: ApiResponse.completed('data fetched successfully'),
          yearlyPerformance: YearlyPerformanceModel.fromJson(dato),
        ));
      } else {
        emit(state.copyWith(
          apiResponse: ApiResponse.error(
            response['error'] ?? 'Error while fetching yearly performance',
          ),
        ));
      }
    } catch (e, stack) {
      emit(state.copyWith(
        apiResponse: ApiResponse.error('Exception: ${e.toString()}'),
      ));
      print('Error in _onFetchYearlyPerformance: $e\n$stack');
    }
  }
}
