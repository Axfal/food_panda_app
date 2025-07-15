import 'package:flutter/material.dart';
import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔷 Dynamic image
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(campaignImage, fit: BoxFit.cover),
                    Positioned(
                      left: 16,
                      top: 40,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black26, width: 1),
                          ),
                          child: const Icon(Icons.arrow_back, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🔷 Padded content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Campaign Info (taps to open sheet)
                    GestureDetector(
                      onTap: () => showCampaignSheet(
                        context,
                        title: sheetTitle,
                        subtitle: sheetSubtitle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey, width: 0.5),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.info_outline),
                            const SizedBox(width: 8),
                            const Text(
                              "Campaign info",
                              style: TextStyle(
                                fontWeight: AppWeights.bold,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            const Row(
                              children: [
                                Text(
                                  "Read more",
                                  style: TextStyle(
                                    fontWeight: AppWeights.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Icon(Icons.chevron_right, size: 18),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 🔷 Food cards
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
