import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utils/constants/app_colors.dart';
import '../data/card_data.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  List<Map<String, dynamic>>? filteredCards;

  @override
  void initState() {
    super.initState();
    filteredCards = foodCards;
  }

  void updateFilteredCards(List<Map<String, dynamic>> newCards) {
    setState(() {
      filteredCards = newCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(
        title: 'Offers',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
          'Coming Soon',
          style: GoogleFonts.poppins(fontSize: 22, color: Colors.black54),
        ),
      ),
    );
  }
}

// ListView(
//         children: [
//           Container(
//             color: AppColors.white,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: CardList(
//                 title: 'Top offers for you',
//                 cardsData: foodCards,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Container(
//             color: AppColors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Discover more deals",
//                     style: GoogleFonts.montserrat(
//                       fontSize: 18,
//                       fontWeight: AppWeights.bold,
//                       color: AppColors.textPrimary,
//                     ),
//                   ),
//                   DiscountCardList(
//                     cards: discountCards,
//                     onTapCard: (card) {
//                       final data = card['DiscountData'];
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => CampaignPage(
//                             campaignImage: data['campaignImage'],
//                             sheetTitle: data['sheetTitle'],
//                             sheetSubtitle: data['sheetSubtitle'],
//                             cardsData: List<Map<String, dynamic>>.from(
//                               data['cardsData'],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           // Container(
//           //   color: AppColors.white,
//           //   padding: const EdgeInsets.symmetric(vertical: 8),
//           //   child: Column(
//           //     children: [
//           //       FilterBar(
//           //         originalData: foodCards,
//           //         onFiltered: updateFilteredCards,
//           //       ),
//           //       const SizedBox(height: 10),
//           //       ...filteredCards!.map(
//           //         (card) => Container(
//           //           margin: const EdgeInsets.symmetric(
//           //             vertical: 6,
//           //             horizontal: 12,
//           //           ),
//           //           child: RowCard(
//           //             imagePath: card['imagePath'],
//           //             title: card['title'],
//           //             rating: card['rating'],
//           //             reviewsCount: card['reviewsCount'],
//           //             duration: card['duration'],
//           //             priceLevel: card['priceLevel'],
//           //             cuisine: card['cuisine'],
//           //             deliveryFee: card['deliveryFee'],
//           //             discountLabel: card['discountLabel'],
//           //             isAd: card['isAd'],
//           //           ),
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
