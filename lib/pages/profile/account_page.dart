import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:excellent_trade_app/pages/restaurant_owner/widgets/logout_dialog_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../bloc/account/profile/profile_bloc.dart';
import '../auth/forgot_password/forget_password_export.dart';
import 'subPages/addresses_page.dart';
import 'subPages/fav_page.dart';
import 'subPages/order_history_screen.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              BlocBuilder<ProfileBloc, ProfileState>(
                buildWhen: (current, previous) =>
                    current.profileApiResponse.status !=
                    previous.profileApiResponse.status,
                builder: (context, state) {
                  final user = state.userModel;

                  return GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.profile),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColors.primary.withValues(
                            alpha: 0.1,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              user.photo,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) => Icon(
                                Icons.person,
                                size: 35,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name.isNotEmpty ? user.name : 'Unknown',
                              style: GoogleFonts.montserrat(
                                fontWeight: AppWeights.extraBold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.email.isNotEmpty ? user.email : 'No email',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: AppWeights.medium,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              // const SizedBox(height: 20),
              // Container(
              //   height: 100,
              //   width: double.infinity,
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: Colors.grey.shade100,
              //     borderRadius: BorderRadius.circular(12),
              //     border: Border.all(color: Colors.grey.shade300),
              //   ),
              //   child: const Center(
              //     child: Text(
              //       'Ad Placeholder',
              //       style: TextStyle(color: Colors.black87),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: buildIconCard(
                      icon: Icons.receipt_long_sharp,
                      label: 'Orders',
                      onTap: () => Navigator.pushNamed(
                        context,
                        RoutesName.orderHistoryScreen,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildIconCard(
                      icon: LucideIcons.heart,
                      label: 'Favourites',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => FavouritesPage()),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildIconCard(
                      icon: LucideIcons.mapPin,
                      label: 'Addresses',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddressesPage()),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Container(
              //   padding: EdgeInsets.all(12),
              //   decoration: BoxDecoration(
              //     color: AppColors.white,
              //     borderRadius: BorderRadius.circular(8),
              //     border: Border.all(
              //       color: AppColors.textSecondary.withAlpha(55),
              //       width: 0.5,
              //     ),
              //   ),
              //   child: Row(
              //     children: [
              //       const Image(
              //         image: AssetImage("assets/images/icons/pandaPay.png"),
              //         height: 20,
              //       ),
              //       const SizedBox(width: 8),
              //       Text(
              //         "Food mate Credit",
              //         style: GoogleFonts.poppins(color: Colors.black87),
              //       ),
              //       const Spacer(),
              //       Text(
              //         "Rs 0.00",
              //         style: GoogleFonts.poppins(color: Colors.black87),
              //       ),
              //     ],
              //   ),
              // ),
              buildItemList(
                heading: 'Perks for you',
                titles: [
                  'Try Food mate  for free',
                  'Food mate  rewards',
                  'Vouchers',
                  'Invite friends',
                ],
                icons: [
                  Icons.card_giftcard_outlined,
                  Icons.star_border,
                  Icons.local_offer_outlined,
                  Icons.group_add_outlined,
                ],
                onTaps: [
                  () => {},
                  () => {},
                  () =>
                      Navigator.pushNamed(context, RoutesName.applyForVoucher),
                  () => Navigator.pushNamed(context, RoutesName.inviteFriends),
                ],
              ),
              buildItemList(
                heading: 'General',
                titles: [
                  'Help Center',
                  'Food mate  for business',
                  'Terms & Policies',
                ],
                icons: [
                  Icons.help_outline,
                  Icons.business_center_outlined,
                  Icons.policy_outlined,
                ],
                onTaps: [() {}, () {}, () {}],
              ),
              const SizedBox(height: 20),
              RoundButton(
                title: 'Logout',
                onPress: () => showLogoutDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      titleSpacing: 16,
      title: Text(
        'Account',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          splashRadius: 24,
          onPressed: () => Navigator.pushNamed(context, RoutesName.setting),
          icon: const Icon(
            Icons.settings_outlined,
            size: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: AppColors.textSecondary.withAlpha(50),
          height: 1,
        ),
      ),
    );
  }

  Widget buildItemList({
    required String heading,
    required List<String> titles,
    required List<IconData> icons,
    required List<VoidCallback> onTaps,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
          child: Text(
            heading,
            style: GoogleFonts.montserrat(
              fontWeight: AppWeights.extraBold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        ...List.generate(titles.length, (index) {
          return ListTile(
            leading: Icon(icons[index], color: Colors.black87),
            title: Text(
              titles[index],
              style: GoogleFonts.montserrat(
                fontWeight: AppWeights.medium,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
              size: 16,
            ),
            onTap: onTaps[index],
          );
        }),
      ],
    );
  }

  Widget buildIconCard({
    String? imagePath,
    IconData? icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textSecondary.withAlpha(64)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(imagePath, height: 24, width: 24)
            else if (icon != null)
              Icon(icon, size: 24, color: Colors.black),
            const SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.poppins(color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
