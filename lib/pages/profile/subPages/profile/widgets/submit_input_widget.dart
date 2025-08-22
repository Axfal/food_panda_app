import '../../../../../bloc/account/profile/profile_bloc.dart';
import '../../../../auth/forgot_password/forget_password_export.dart';
import '../profile_export.dart';

class SubmitInputWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const SubmitInputWidget({super.key, required this.formKey});

  @override
  State<SubmitInputWidget> createState() => _SubmitInputWidgetState();
}

class _SubmitInputWidgetState extends State<SubmitInputWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      buildWhen: (current, previous) =>
      current.profileApiResponse.status !=
          previous.profileApiResponse.status,
      listener: (context, state) {
        if (state.profileApiResponse.status == Status.error) {
          context.flushBarErrorMessage(
            message: state.profileApiResponse.message.toString(),
          );
        }

        // Only show success message if it's an update, not fetch
        if (state.profileApiResponse.status == Status.completed &&
            state.profileApiResponse.data != 'Profile data fetched') {
          context.flushBarSuccessMessage(
            message: state.profileApiResponse.data.toString(),
          );
          context.read<ProfileBloc>().add(FetchProfileEvent(id: state.userModel.id.toString()));
        }
      },
      builder: (context, state) {
        return RoundButton(
          loading: state.profileApiResponse.status == Status.loading,
          title: "Save",
          onPress: () {
            if (widget.formKey.currentState!.validate()) {
              context.read<ProfileBloc>().add(UpdateProfileEvent());
            }
          },
        );
      },
    );
  }
}
