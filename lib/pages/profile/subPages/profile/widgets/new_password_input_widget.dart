import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:excellent_trade_app/bloc/account/profile/profile_bloc.dart';
import 'package:excellent_trade_app/config/components/custom_text_field.dart';

class NewPasswordInputWidget extends StatefulWidget {
  const NewPasswordInputWidget({super.key});

  @override
  State<NewPasswordInputWidget> createState() => _NewPasswordInputWidgetState();
}

class _NewPasswordInputWidgetState extends State<NewPasswordInputWidget> {
  final newPasswordController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    newPasswordController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return CustomTextField(
          label: "New Password",
          hintText: "Enter your new password",
          controller: newPasswordController,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          obscureText: true,
          onChanged: (value) {
            context
                .read<ProfileBloc>()
                .add(NewPasswordChangeEvent(newPassword: value));
            debugPrint("New password: $value");
          },
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Password cannot be empty";
          //   } else if (value.length < 6) {
          //     return "Password must be at least 6 characters";
          //   }
          //   return null;
          // },
        );
      },
    );
  }
}
