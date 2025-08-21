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
    return RoundButton(
      title: "Save",
      onPress: () {
        if (widget.formKey.currentState!.validate()) {
        }
      },
    );
  }
}
