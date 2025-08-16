import 'package:excellent_trade_app/config/components/custom_phone_field.dart';
import '../restaurant_exports.dart';

class PhoneInputWidget extends StatefulWidget {
  final String? phone;
  const PhoneInputWidget({super.key, this.phone});

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  final phoneController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.phone != null && widget.phone!.isNotEmpty) {
      String cleaned = widget.phone!.replaceFirst(RegExp(r'^\+92'), '');
      phoneController.text = cleaned;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantStates>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
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
            context.read<RestaurantBloc>().add(
              PhoneChangeEvent(phone: code + number),
            );
          },
        );
      },
    );
  }
}
