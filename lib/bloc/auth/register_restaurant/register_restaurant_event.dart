part of 'register_restaurant_bloc.dart';

sealed class RegisterRestaurantEvent extends Equatable {
  const RegisterRestaurantEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogoChangeEvent extends RegisterRestaurantEvent {
  final File logo;
  const LogoChangeEvent({required this.logo});
  @override
  // TODO: implement props
  List<Object?> get props => [logo];
}

class RestaurantNameChangeEvent extends RegisterRestaurantEvent {
  final String restaurantName;
  const RestaurantNameChangeEvent({required this.restaurantName});
  @override
  // TODO: implement props
  List<Object?> get props => [restaurantName];
}

class PhoneChangeEvent extends RegisterRestaurantEvent {
  final String phone;
  const PhoneChangeEvent({required this.phone});
  @override
  // TODO: implement props
  List<Object?> get props => [phone];
}

class AddressChangeEvent extends RegisterRestaurantEvent {
  final String address;
  const AddressChangeEvent({required this.address});
  @override
  // TODO: implement props
  List<Object?> get props => [address];
}

class DescriptionChangeEvent extends RegisterRestaurantEvent {
  final String description;
  const DescriptionChangeEvent({required this.description});
  @override
  // TODO: implement props
  List<Object?> get props => [description];
}

class SubmitFormEvent extends RegisterRestaurantEvent {
  final String ownerId;
  const SubmitFormEvent({
    required this.ownerId
});
  @override
  // TODO: implement props
  List<Object?> get props => [ownerId];
}
