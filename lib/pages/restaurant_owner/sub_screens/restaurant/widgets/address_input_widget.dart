import '../../../../../bloc/location/location_bloc.dart';
import '../restaurant_exports.dart';

class AddressInputWidget extends StatefulWidget {
  final String? address;
  const AddressInputWidget({super.key, this.address});

  @override
  State<AddressInputWidget> createState() => _AddressInputWidgetState();
}

class _AddressInputWidgetState extends State<AddressInputWidget> {
  final TextEditingController addressController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  String? selectedPlaceId;

  @override
  void initState() {
    super.initState();

    final bloc = context.read<RestaurantBloc>().state;
    if (bloc.address.isNotEmpty) {
      addressController.text = bloc.address;
      context.read<RestaurantBloc>().add(
        AddressChangeEvent(address: bloc.address),
      );
    }

    context.read<LocationBloc>().add(
      const FetchLocationSuggestionEvent(query: ''),
    );
  }

  @override
  void dispose() {
    addressController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (value.trim().isNotEmpty) {
      context.read<LocationBloc>().add(
        FetchLocationSuggestionEvent(query: value),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, locState) {
        final place = locState.locationDetailsModel.place;
        if (place != null) {
          final String lng = "${place.lng}";
          final String lat = "${place.lat}";
          final String placeId = place.placeId;

          context.read<RestaurantBloc>().add(LngChangeEvent(lng: lng));
          context.read<RestaurantBloc>().add(LatChangeEvent(lat: lat));
          context.read<RestaurantBloc>().add(
            PlaceIdChangeEvent(placeId: placeId),
          );
        }
      },
      child: Column(
        children: [
          BlocBuilder<RestaurantBloc, RestaurantStates>(
            buildWhen: (previous, current) =>
                previous.address != current.address,
            builder: (context, state) {
              if (state.address.isNotEmpty &&
                  state.address != addressController.text) {
                addressController.text = state.address;
                addressController.selection = TextSelection.fromPosition(
                  TextPosition(offset: addressController.text.length),
                );
              }

              return CustomTextField(
                label: 'Address',
                hintText: "Enter your address",
                controller: addressController,
                focusNode: focusNode,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Address is required";
                  }
                  if (value.trim().length < 5) {
                    return "Address must be at least 5 characters";
                  }
                  return null;
                },
                onChanged: (value) {
                  _onSearchChanged(value);
                  context.read<RestaurantBloc>().add(
                    AddressChangeEvent(address: value.trim()),
                  );
                },
              );
            },
          ),

          // Suggestions list
          BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              if (state.apiResponse.status == Status.loading) {
                return const LinearProgressIndicator();
              }

              final suggestions = state.locationSuggestionModel.suggestions;
              if (suggestions.isEmpty || focusNode.hasFocus == false) {
                return const SizedBox();
              }

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                constraints: const BoxConstraints(maxHeight: 250),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: suggestions.length,
                  separatorBuilder: (_, _) =>
                      Divider(color: Colors.grey.shade300, height: 0),
                  itemBuilder: (context, index) {
                    final item = suggestions[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedPlaceId = item.placeId;
                          addressController.text = item.description;
                          context.read<RestaurantBloc>().add(
                            AddressChangeEvent(address: item.description),
                          );
                          context.read<RestaurantBloc>().add(
                            PlaceIdChangeEvent(placeId: selectedPlaceId!),
                          );
                          focusNode.unfocus();
                        });

                        // Fetch location details asynchronously
                        context.read<LocationBloc>().add(
                          FetchLocationDetailsEvent(placeId: selectedPlaceId!),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                item.description,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            if (selectedPlaceId == item.placeId)
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: AppColors.primary,
                                child: const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
