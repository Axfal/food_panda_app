
import 'restaurant_exports.dart';

class RegisterRestaurant extends StatefulWidget {
  final String userId;
  const RegisterRestaurant({super.key, required this.userId});

  @override
  State<RegisterRestaurant> createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  // late RestaurantBloc _registerRestaurantBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // _registerRestaurantBloc = RestaurantBloc(
    //   restaurantApiRepository: getIt(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Register Restaurant',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        // child: BlocProvider(
        //   create: (_) => _registerRestaurantBloc,
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Restaurant Logo
                     LogoInputWidget(),

                      const SizedBox(height: 20),

                      /// Name
                      NameInputWidget(),
                      const SizedBox(height: 16),

                      /// Phone
                      PhoneInputWidget(),

                      /// Address
                      AddressInputWidget(),
                      const SizedBox(height: 16),

                      /// Description
                      DescriptionInputWidget(),
                      const SizedBox(height: 24),

                      /// Submit Button (triggers validation + event)
                      SubmitButton(formKey: _formKey, userId: widget.userId),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      // ),
    );
  }
}
