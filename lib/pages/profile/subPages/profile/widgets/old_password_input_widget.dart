import 'package:excellent_trade_app/config/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../bloc/account/profile/profile_bloc.dart';
import '../profile_export.dart';

class OldPasswordInputWidget extends StatefulWidget {
  const OldPasswordInputWidget({super.key});

  @override
  State<OldPasswordInputWidget> createState() => _OldPasswordInputWidgetState();
}

class _OldPasswordInputWidgetState extends State<OldPasswordInputWidget> {
  final TextEditingController oldPasswordController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    oldPasswordController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (current, previous) =>
          current.oldPassword != previous.oldPassword,
      builder: (context, state) {
        if (state.oldPassword != oldPasswordController.text) {
          oldPasswordController.text = state.oldPassword;
          oldPasswordController.selection = TextSelection.fromPosition(
            TextPosition(offset: oldPasswordController.text.length),
          );
        }

        return CustomTextField(
          label: 'Old Password',
          hintText: "Enter your old password",
          controller: oldPasswordController,
          focusNode: focusNode,
          obscureText: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          // validator: (value) {
          //   if (value == null || value.trim().isEmpty) {
          //     return "Please enter your old password";
          //   }
          //   return null;
          // },
          onChanged: (value) {
            context.read<ProfileBloc>().add(
              OldPasswordChange(oldPassword: value),
            );
          },
        );
      },
    );
  }
}
