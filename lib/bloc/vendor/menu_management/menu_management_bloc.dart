import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_category/menu_category_model.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_item/menu_item_model.dart';
import 'package:meta/meta.dart';

part 'menu_management_event.dart';
part 'menu_management_state.dart';

class MenuManagementBloc extends Bloc<MenuManagementEvent, MenuManagementState> {
  MenuManagementBloc() : super(MenuManagementInitial()) {
    on<MenuManagementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
