import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../bloc/location/location_bloc.dart';
import 'package:flutter/gestures.dart';
import '../../model/location/location_details/locations_details_model.dart';
import '../../service/location/location_storage.dart';
import '../auth/signup/signup_exports.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  GoogleMapController? _mapController;
  // final TextEditingController _controller = TextEditingController();
  bool showSuggestions = false;
  LatLng selectedLocation = LatLng(31.5204, 74.3587);

  // void _onMapCreated(GoogleMapController controller) {
  //   _mapController = controller;
  // }
  //
  // void _onCameraMove(CameraPosition position) {
  //   setState(() {
  //     selectedLocation = position.target;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: 'Checkout',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    stepItem("1", "Menu", isCompleted: true),
                    stepLine(isActive: true),
                    stepItem("2", "Cart", isCompleted: true),
                    stepLine(isActive: true),
                    stepItem("3", "Checkout", isActive: true),
                  ],
                ),
              ),
            ),
            locationWidget(context),
            DeliveryOptionWidget(
              options: [
                DeliveryOption(title: "Saver Delivery", time: "50 minutes"),
                DeliveryOption(title: "Standard Delivery", time: "30 minutes"),
                DeliveryOption(title: "Priority Delivery", time: "15 minutes"),
              ],
              onOptionSelected: (option) {
                print("Selected: ${option.title}");
              },
            ),
            paymentMethodWidget(),
            orderSummaryWidget(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total (incl. fee & tax)",
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See summary",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Rs. 220.50',
                          style: GoogleFonts.poppins(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Rs. 440.50",
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.payment, size: 18.sp),
                  label: Text(
                    "Select payment method",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget locationWidget(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    bool showSuggestions = false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
          ],
        ),
        child: BlocConsumer<LocationBloc, LocationState>(
          listener: (context, state) {
            if (state.locationDetailsModel.place != null) {
              final place = state.locationDetailsModel.place!;
              selectedLocation = LatLng(place.lat, place.lng);
              _mapController?.animateCamera(
                CameraUpdate.newLatLng(selectedLocation),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title Row
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.redAccent),
                    SizedBox(width: 8.w),
                    Text(
                      'Delivery Address',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                /// 🔍 Search Field
                TextField(
                  controller: _searchController,
                  style: GoogleFonts.poppins(color: Colors.black87, fontSize: 14.sp),
                  cursorColor: Colors.black54,
                  decoration: InputDecoration(
                    hintText: "Search location...",
                    hintStyle: GoogleFonts.poppins(color: Colors.black54),
                    prefixIcon: const Icon(Icons.search, color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 12.w,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: const BorderSide(color: Colors.black54, width: 1.2),
                    ),
                  ),
                  onChanged: (query) {
                    if (query.isNotEmpty) {
                      showSuggestions = true;
                      context.read<LocationBloc>().add(
                        FetchLocationSuggestionEvent(query: query),
                      );
                    } else {
                      showSuggestions = false;
                    }
                  },
                ),
                SizedBox(height: 10.h),

                /// 📍 Suggestions List
                if (showSuggestions &&
                    state.locationSuggestionModel.suggestions.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    constraints: BoxConstraints(maxHeight: 180.h),
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: state.locationSuggestionModel.suggestions.length,
                      separatorBuilder: (_, __) => Divider(
                        color: Colors.grey.shade300,
                        height: 1,
                        thickness: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final suggestion =
                        state.locationSuggestionModel.suggestions[index];
                        return ListTile(
                          leading: const Icon(Icons.location_on_outlined,
                              color: Colors.black54),
                          title: Text(
                            suggestion.description,
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              color: Colors.black87,
                            ),
                          ),
                          onTap: () {
                            showSuggestions = false;
                            _searchController.text = suggestion.description;

                            FocusScope.of(context).unfocus(); // 👈 Hide keyboard

                            context.read<LocationBloc>().add(
                              FetchLocationDetailsEvent(
                                placeId: suggestion.placeId,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                SizedBox(height: 12.h),

                /// 🗺️ Google Map
                SizedBox(
                  height: 300.h,
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: selectedLocation,
                          zoom: 15,
                        ),
                        onMapCreated: (controller) => _mapController = controller,
                        onCameraMove: (position) {
                          selectedLocation = position.target;
                        },
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: false,
                        zoomGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        rotateGesturesEnabled: true,
                        tiltGesturesEnabled: false,
                        gestureRecognizers: {
                          Factory<OneSequenceGestureRecognizer>(
                                () => EagerGestureRecognizer(),
                          ),
                        },
                      ),
                      /// Fixed pointer marker
                      Center(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                          size: 40.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                /// Selected Address Display
                Text(
                  "Selected Address",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Lat: ${selectedLocation.latitude.toStringAsFixed(5)}, "
                      "Lng: ${selectedLocation.longitude.toStringAsFixed(5)}",
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: Colors.grey[700],
                  ),
                ),

                SizedBox(height: 12.h),

                /// Confirm Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final place = Place(
                        placeId: "manual-selected",
                        name: "Pinned Location",
                        address: "",
                        lat: selectedLocation.latitude,
                        lng: selectedLocation.longitude,
                      );
                      final location = LocationDetailsModel(
                        success: true,
                        place: place,
                      );

                      await LocationSessionController().saveLocation(location);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Location saved: ${selectedLocation.latitude}, ${selectedLocation.longitude}",
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      "Confirm Location",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget orderSummaryWidget() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Row
          Row(
            children: [
              Icon(Icons.list_alt_outlined, color: Colors.black87),
              SizedBox(width: 8.w),
              Text(
                'Order Summary',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          /// Order Item
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "1x Beef Pulao 1KG with Podina Raita",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                'Rs. 1499.40',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(),

          /// Charges Breakdown
          SizedBox(height: 8.h),
          _summaryRow('Subtotal', 'Rs. 1499.40'),
          _summaryRow('Standard Delivery', 'Rs. 149.50'),
          _summaryRow('Platform Fee', 'Rs. 50.00'),
          Divider(),

          /// Voucher CTA
          SizedBox(height: 8.h),
          InkWell(
            onTap: () {
             Navigator.pushNamed(context, RoutesName.applyForVoucher);
            },
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: .089),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.card_giftcard, color: AppColors.primary),
                  SizedBox(width: 10.w),
                  Text(
                    "Apply a voucher",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _summaryRow(String title, String amount) => Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black45),
        ),
        Text(
          amount,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black45,
          ),
        ),
      ],
    ),
  );

  Widget paymentMethodWidget() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wallet_outlined, color: Colors.black87),
              SizedBox(width: 10.w),
              Text(
                'Payment Method',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Divider(height: 24.h, thickness: 1, color: Colors.grey.shade200),
          InkWell(
            onTap: () {
              // Handle add payment method action
            },
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.primary),
                  SizedBox(width: 10.w),
                  Text(
                    'Add a payment method',
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );


  Widget stepItem(
    String number,
    String label, {
    bool isActive = false,
    bool isCompleted = false,
  }) {
    final bgColor = (isCompleted || isActive)
        ? AppColors.primary
        : Colors.grey.shade300;

    final content = isCompleted
        ? Icon(Icons.check, color: Colors.white, size: 16.sp)
        : Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          );

    return Column(
      children: [
        CircleAvatar(radius: 16.r, backgroundColor: bgColor, child: content),
        SizedBox(height: 6.h),
        SizedBox(
          width: 60.w,
          child: Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isActive ? AppColors.primary : Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  /// Step line widget connecting steps
  Widget stepLine({bool isActive = false}) {
    return Expanded(
      child: Container(
        height: 4.h,
        margin: EdgeInsets.symmetric(vertical: 16.h),
        color: isActive ? AppColors.primary : Colors.grey.shade300,
      ),
    );
  }
}

class DeliveryOptionWidget extends StatefulWidget {
  final List<DeliveryOption> options;
  final Function(DeliveryOption) onOptionSelected;

  const DeliveryOptionWidget({
    super.key,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  State<DeliveryOptionWidget> createState() => _DeliveryOptionWidgetState();
}

class _DeliveryOptionWidgetState extends State<DeliveryOptionWidget> {
  DeliveryOption? selectedOption;

  @override
  void initState() {
    super.initState();
    if (widget.options.isNotEmpty) {
      selectedOption = widget.options.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Option',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            ...widget.options.map((option) {
              final isActive = option == selectedOption;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary.withValues(alpha: .098)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isActive ? AppColors.primary : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          selectedOption = option;
                        });
                        widget.onOptionSelected(option);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.primary
                                    : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                option.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: isActive
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isActive
                                      ? AppColors.primary
                                      : Colors.black87,
                                ),
                              ),
                            ),
                            Text(
                              option.time,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: isActive
                                    ? AppColors.primary
                                    : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class DeliveryOption {
  final String title;
  final String time;

  DeliveryOption({required this.title, required this.time});
}
