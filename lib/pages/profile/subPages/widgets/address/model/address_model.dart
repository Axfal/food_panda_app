// address_model.dart
class AddressModel {
  final String placeType;
  final String city;
  final String note;
  final String muhalla;
  final String deliveryDetails;
  final String doorInfo;
  final String landmark;
  final bool gatedCommunity;
  final String? entryCode;
  final String? entryOther;
  final String? additionalInstructions;
  final String label;

  AddressModel({
    required this.placeType,
    required this.city,
    required this.note,
    required this.muhalla,
    required this.deliveryDetails,
    required this.doorInfo,
    required this.landmark,
    required this.gatedCommunity,
    this.entryCode,
    this.entryOther,
    this.additionalInstructions,
    required this.label,
  });
}