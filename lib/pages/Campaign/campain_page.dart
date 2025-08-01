import 'package:flutter/material.dart';
import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utils/constants/app_colors.dart';
import '../../globalWidgets/PrimeryWidgets/customeButtons.dart';
import '../home/widgets/cards/large_foodCard.dart';

class CampaignPage extends StatelessWidget {
  final String campaignImage;
  final String sheetTitle;
  final String sheetSubtitle;
  final List<Map<String, dynamic>> cardsData;

  const CampaignPage({
    super.key,
    required this.campaignImage,
    required this.cardsData,
    required this.sheetTitle,
    required this.sheetSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.fastfood_rounded,
                        color: Colors.black12.withValues(alpha: 0.3),
                        size: 120,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 16,
                    top: 60,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 📣 Campaign Info Card
                  GestureDetector(
                    onTap: () => showCampaignSheet(
                      context,
                      title: sheetTitle,
                      subtitle: sheetSubtitle,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, color: AppColors.black54),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Campaign Info",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          Text(
                            "Read more",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black54,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.chevron_right, size: 18, color: AppColors.black54),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 🧭 Explore Title
                  Text(
                    "Explore More",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),


                  // 🍔 Food Cards
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cardsData.length,
                    itemBuilder: (context, index) {
                      final card = cardsData[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: LargeFoodCard(
                          imagePath: card['imagePath'],
                          title: card['title'],
                          rating: card['rating'],
                          reviewsCount: card['reviewsCount'],
                          duration: card['duration'],
                          priceLevel: card['priceLevel'],
                          cuisine: card['cuisine'],
                          deliveryFee: card['deliveryFee'],
                          discountLabel: card['discountLabel'],
                          isAd: card['isAd'],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

// 🔽 Dynamic bottom sheet
void showCampaignSheet(
  BuildContext context, {
  required String title,
  required String subtitle,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Close",
                onTap: () => Navigator.pop(context),
                color: AppColors.white,
              ),
            ),
          ],
        ),
      );
    },
  );
}
