import 'package:excellent_trade_app/config/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/account/profile/profile_bloc.dart';
import '../../../../auth/forgot_password/forget_password_export.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({super.key});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    final user = context.read<ProfileBloc>().state.userModel;
    emailController.text = user.email;
  }

  @override
  void dispose() {
    emailController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return CustomTextField(
          label: 'Email',
          hintText: "Enter your email",
          controller: emailController,
          focusNode: focusNode,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
