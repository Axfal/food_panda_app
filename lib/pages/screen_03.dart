import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/constants/app_colors.dart';

class Screen03 extends StatefulWidget {
  const Screen03({super.key});

  @override
  State<Screen03> createState() => _Screen03State();
}

class _Screen03State extends State<Screen03> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: searchAppBar(context),
        body: TabBarView(
          children: [
            buildTabContent('All Items'),
            buildTabContent('Popular'),
            buildTabContent('PSL Deals'),
            buildTabContent('PEPSI Kamaaal Kombos'),
            buildTabContent('Riwayati Pulao'),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget searchAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextFormField(
            cursorColor: AppColors.primary,
            style: GoogleFonts.poppins(fontSize: 13),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              prefixIcon: const Icon(Icons.search_rounded, size: 22, color: Colors.black54),
              hintText: 'Search in Bannu Beef Pulao - Thokar',
              hintStyle: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert, color: Colors.black),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
          alignment: Alignment.centerLeft,
          child: TabBar(
            isScrollable: true,
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.primary,
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            physics: BouncingScrollPhysics(),
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Popular'),
              Tab(text: 'PSL Deals'),
              Tab(text: 'PEPSI Kamaaal Kombos'),
              Tab(text: 'Riwayati Pulao'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabContent(String title) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < 5; i++)
            ItemCard(
              title: 'Item $i',
              subtitle: 'Tasty & Fresh',
              price: 'Rs. ${899 + i * 100}',
            ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;

  const ItemCard({super.key,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              color: Color(0xFFF5F5F5),
            ),
            child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: GoogleFonts.poppins(
                          color: Colors.grey.shade700, fontSize: 13)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary,
                        ),
                        child: Text(
                          'Add',
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
