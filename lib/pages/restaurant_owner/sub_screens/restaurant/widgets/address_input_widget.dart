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

  @override
  void initState() {
    super.initState();

    // Prefill from previous screen
    if (widget.address != null && widget.address!.isNotEmpty) {
      addressController.text = widget.address!;
      context.read<RestaurantBloc>().add(
        AddressChangeEvent(address: widget.address!),
      );
    }
  }

  @override
  void dispose() {
    addressController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantStates>(
      buildWhen: (previous, current) => previous.address != current.address,
      builder: (context, state) {
        // Keep controller in sync with bloc state
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
          maxLines: 2,
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
            context.read<RestaurantBloc>().add(
              AddressChangeEvent(address: value.trim()),
            );
          },
        );
      },
    );
  }
}
