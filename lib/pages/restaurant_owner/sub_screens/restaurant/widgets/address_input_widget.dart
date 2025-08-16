import '../restaurant_exports.dart';

class AddressInputWidget extends StatefulWidget {
  final String? address;
  const AddressInputWidget({super.key, this.address});

  @override
  State<AddressInputWidget> createState() => _AddressInputWidgetState();
}

class _AddressInputWidgetState extends State<AddressInputWidget> {
  final addressController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.address != null && widget.address!.isNotEmpty) {
      addressController.text = widget.address!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantStates>(
      buildWhen: (previous, current) => previous.address != current.address,
      builder: (context, state) {
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
            return null;
          },
          onChanged: (value) {
            context.read<RestaurantBloc>().add(
              AddressChangeEvent(address: value),
            );
          },
        );
      },
    );
  }
}
