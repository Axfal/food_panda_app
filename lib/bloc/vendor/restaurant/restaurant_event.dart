part of 'restaurant_bloc.dart';

sealed class RestaurantEvent extends Equatable {
  const RestaurantEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogoChangeEvent extends RestaurantEvent {
  final File logo;
  const LogoChangeEvent({required this.logo});
  @override
  // TODO: implement props
  List<Object?> get props => [logo];
}

class StatusChangeEvent extends RestaurantEvent {
  final String status;
  const StatusChangeEvent({required this.status});
  @override
  List<Object> get props => [status];
}

class HoursChangeEvent extends RestaurantEvent {
  final String hours;
  const HoursChangeEvent({required this.hours});

  @override
  // TODO: implement props
  List<Object?> get props => [hours];
}

class RestaurantNameChangeEvent extends RestaurantEvent {
  final String restaurantName;
  const RestaurantNameChangeEvent({required this.restaurantName});
  @override
  // TODO: implement props
  List<Object?> get props => [restaurantName];
}

class PhoneChangeEvent extends RestaurantEvent {
  final String phone;
  const PhoneChangeEvent({required this.phone});
  @override
  // TODO: implement props
  List<Object?> get props => [phone];
}

class AddressChangeEvent extends RestaurantEvent {
  final String address;
  const AddressChangeEvent({required this.address});
  @override
  // TODO: implement props
  List<Object?> get props => [address];
}

class DescriptionChangeEvent extends RestaurantEvent {
  final String description;
  const DescriptionChangeEvent({required this.description});
  @override
  // TODO: implement props
  List<Object?> get props => [description];
}

class FetchRestaurantEvent extends RestaurantEvent {
  const FetchRestaurantEvent();

  @override
  List<Object> get props => [];
}

class DeleteRestaurantEvent extends RestaurantEvent {
  final String id;
  const DeleteRestaurantEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class SubmitFormEvent extends RestaurantEvent {
  final String ownerId;
  const SubmitFormEvent({required this.ownerId});
  @override
  // TODO: implement props
  List<Object?> get props => [ownerId];
}
