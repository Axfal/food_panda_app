import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/performance/monthly_performance_model.dart';
import 'package:excellent_trade_app/model/performance/weekly_performance_model.dart';
import 'package:excellent_trade_app/model/performance/yearly_performance_model.dart';

part 'performance_event.dart';
part 'performance_state.dart';

class PerformanceBloc extends Bloc<PerformanceEvent, PerformanceState> {
  PerformanceBloc() : super(PerformanceInitial()) {
    on<PerformanceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
