import 'package:excellent_trade_app/model/profile/profile_model.dart';
import '../../../../../bloc/account/profile/profile_bloc.dart';
import '../../../../auth/forgot_password/forget_password_export.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final TextEditingController nameController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    final user = context.read<ProfileBloc>().state.userModel;
    nameController.text = user.name;
  }

  @override
  void dispose() {
    nameController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (current, previous) =>
      current.name != previous.name,
      builder: (context, state) {
        return CustomTextField(
          label: 'Name',
          hintText: 'Enter your name',
          controller: nameController,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          // validator: (value) {
          //   if (value == null || value.trim().isEmpty) {
          //     return 'Please enter your name';
          //   }
          //   return null;
          // },
          onChanged: (value) {
            context.read<ProfileBloc>().add(NameChangeEvent(name: value));
          },
        );
      },
    );
  }
}
