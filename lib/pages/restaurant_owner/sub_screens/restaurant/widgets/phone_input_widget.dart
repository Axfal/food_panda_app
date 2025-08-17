import 'package:excellent_trade_app/config/components/custom_phone_field.dart';
import '../restaurant_exports.dart';

class PhoneInputWidget extends StatefulWidget {
  final String? phone; // phone from previous screen / API
  const PhoneInputWidget({super.key, this.phone});

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  final TextEditingController phoneController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Prefill from previous screen
    if (widget.phone != null && widget.phone!.isNotEmpty) {
      // remove +92 if present so we don’t duplicate it in field
      String cleaned = widget.phone!.replaceFirst(RegExp(r'^\+92'), '');
      phoneController.text = cleaned;

      // push to bloc
      context.read<RestaurantBloc>().add(
        PhoneChangeEvent(phone: widget.phone!),
      );
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantStates>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
        // Sync controller with bloc state
        if (state.phone.isNotEmpty &&
            state.phone != ("+92${phoneController.text}")) {
          String cleaned = state.phone.replaceFirst(RegExp(r'^\+92'), '');
          phoneController.text = cleaned;
          phoneController.selection = TextSelection.fromPosition(
            TextPosition(offset: phoneController.text.length),
          );
        }

        return CustomPhoneField(
          label: "Phone Number",
          hintText: "Enter your phone number",
          controller: phoneController,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Phone number is required";
            }
            final cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');
            if (cleaned.length < 10) {
              return "Enter a valid phone number";
            }
            return null;
          },
          onChanged: (code, number) {
            final fullPhone = "$code$number".trim();
            context.read<RestaurantBloc>().add(
              PhoneChangeEvent(phone: fullPhone),
            );
          },
        );
      },
    );
  }
}
