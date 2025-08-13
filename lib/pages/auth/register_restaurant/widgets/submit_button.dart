import 'package:excellent_trade_app/config/components/round_button_widget.dart';

import '../restaurant_exprots.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return RoundButton(title: 'Submit', onPress: () {});
  }
}
