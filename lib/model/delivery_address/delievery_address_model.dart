class DeliveryAddress {
  final double lat;
  final double lng;
  String houseNo;
  String street;
  String city;

  DeliveryAddress({
    required this.lat,
    required this.lng,
    this.houseNo = "",
    this.street = "",
    this.city = "",
  });

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
    "house_no": houseNo,
    "street": street,
    "city": city,
  };

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
    lat: json["lat"],
    lng: json["lng"],
    houseNo: json["house_no"] ?? "",
    street: json["street"] ?? "",
    city: json["city"] ?? "",
  );
}
