import 'package:excellent_trade_app/config/components/custom_phone_field.dart';
import '../restaurant_exports.dart';

class PhoneInputWidget extends StatefulWidget {
  final String? phone;
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
    final bloc = context.read<RestaurantBloc>();
    if (bloc.state.phone.isNotEmpty) {
      String cleaned = bloc.state.phone.replaceFirst(RegExp(r'^\+92'), '');
      phoneController.text = cleaned;

      context.read<RestaurantBloc>().add(
        PhoneChangeEvent(phone: bloc.state.phone),
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
    return BlocListener<RestaurantBloc, RestaurantStates>(
      listenWhen: (previous, current) => previous.phone != current.phone,
      listener: (context, state) {
        if (state.phone.isNotEmpty) {
          String cleaned = state.phone.replaceFirst(RegExp(r'^\+92'), '');
          phoneController.text = cleaned;
          phoneController.selection = TextSelection.fromPosition(
            TextPosition(offset: phoneController.text.length),
          );
        }
      },
      child: CustomPhoneField(
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
      ),
    );
  }
}
