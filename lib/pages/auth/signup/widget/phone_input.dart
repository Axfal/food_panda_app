import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({super.key});

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (current, previous) => current.phone != previous.phone,
      builder: (context, state) {
        return CustomPhoneField(
          label: 'Phone Number',
          hintText: 'Enter phone number',
          controller: phoneController,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          onChanged: (phone) {
            if (phone.isEmpty) {
              return 'Please Enter Phone Number';
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter phone number';
            } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
              return 'Phone number must contain digits only';
            } else if (value.length < 10 || value.length > 15) {
              return 'Phone number must be between 10 to 15 digits';
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}
