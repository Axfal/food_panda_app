import 'package:excellent_trade_app/config/components/custom_drop_down_button.dart';
import 'package:excellent_trade_app/pages/auth/signup/signup_exports.dart';

class DropDownButtonInput extends StatefulWidget {
  const DropDownButtonInput({super.key});

  @override
  State<DropDownButtonInput> createState() => _DropDownButtonInputState();
}

class _DropDownButtonInputState extends State<DropDownButtonInput> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (previous, current) => previous.role != current.role,
      builder: (context, state) {
        return CustomDropdownButton(
          hintText: "Select User Type",
          items: ['customer', 'restaurant_owner'],
          value: null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select user role';
            }
            return null;
          },
          onChanged: (value) {
            context.read<SignupBloc>().add(RoleChange(role: value!));
          },
        );
      },
    );
  }
}
