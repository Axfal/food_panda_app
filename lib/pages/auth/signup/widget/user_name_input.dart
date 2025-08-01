import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class UserNameInput extends StatefulWidget {
  const UserNameInput({super.key});

  @override
  State<UserNameInput> createState() => _UserNameInputState();
}

class _UserNameInputState extends State<UserNameInput> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (current, previous) => current.userName != previous.userName,

      builder: (context, state) {
        return CustomTextField(
          prefixIcon: Icons.person,
          label: 'User Name',
          hintText: 'Enter User Name',
          controller: userNameController,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter username';
            } else if (value.length < 3) {
              return 'Username must be at least 3 characters';
            } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
              return 'Username can only contain letters, numbers, and underscores';
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}
