import 'package:excellent_trade_app/pages/restaurant_owner/sub_screens/restaurant/widgets/set_category_input_widget.dart';
import 'package:excellent_trade_app/pages/restaurant_owner/sub_screens/restaurant/widgets/timing_input_widget.dart';

import '../../../../model/vender/restaurant/restaurant_model.dart';
import 'restaurant_exports.dart';

class RegisterRestaurant extends StatefulWidget {
  final String userId;
  final Restaurant? restaurant;
  const RegisterRestaurant({super.key, required this.userId, this.restaurant});

  @override
  State<RegisterRestaurant> createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: widget.restaurant == null
            ? 'Register Restaurant'
            : 'Update Restaurant',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Restaurant Logo
                    LogoInputWidget(),

                    const SizedBox(height: 20),

                    /// Name
                    NameInputWidget(name: widget.restaurant?.name),
                    const SizedBox(height: 16),

                    /// Category
                    SetCategoryInputWidget(),
                    const SizedBox(height: 16),

                    /// Time
                    TimingInputWidget(
                      id: widget.restaurant?.id.toString(),
                      timing: widget.restaurant?.hours,
                    ),
                    const SizedBox(height: 16),

                    /// Phone
                    PhoneInputWidget(phone: widget.restaurant?.phone),

                    /// Address
                    AddressInputWidget(address: widget.restaurant?.location.address),
                    const SizedBox(height: 16),

                    /// Description
                    DescriptionInputWidget(
                      description: widget.restaurant?.description,
                    ),
                    const SizedBox(height: 24),

                    /// Submit Button
                    SubmitButton(
                      formKey: _formKey,
                      userId: widget.userId,
                      restaurant: widget.restaurant,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
