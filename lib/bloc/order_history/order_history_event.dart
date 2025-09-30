part of 'order_history_bloc.dart';

sealed class OrderHistoryEvent extends Equatable {
  const OrderHistoryEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchOrdersHistoryEvent extends OrderHistoryEvent {
  final String customerId;
  const FetchOrdersHistoryEvent({required this.customerId});
  @override
  // TODO: implement props
  List<Object?> get props => [customerId];
}

class OrderStatusUpdatedEvent extends OrderHistoryEvent {
  final Map<String, dynamic> updateData;
  const OrderStatusUpdatedEvent(this.updateData);

  @override
  List<Object?> get props => [updateData];
}