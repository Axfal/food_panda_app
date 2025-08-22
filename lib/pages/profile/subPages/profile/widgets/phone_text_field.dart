import 'package:excellent_trade_app/config/components/custom_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/account/profile/profile_bloc.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({super.key});

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  final TextEditingController phoneController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    final user = context.read<ProfileBloc>().state.userModel;
    phoneController.text = user.phone;
  }

  @override
  void dispose() {
    phoneController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return CustomPhoneField(
          label: "Mobile Number",
          hintText: "Enter your mobile number",
          controller: phoneController,
          focusNode: focusNode,
          enable: false,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
