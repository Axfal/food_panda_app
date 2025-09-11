import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'performance_event.dart';
part 'performance_state.dart';

class PerformanceBloc extends Bloc<PerformanceEvent, PerformanceState> {
  PerformanceBloc() : super(PerformanceInitial()) {
    on<PerformanceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
