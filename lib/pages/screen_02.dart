import 'package:google_fonts/google_fonts.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';

class Screen02 extends StatefulWidget {
  const Screen02({super.key});

  @override
  State<Screen02> createState() => _Screen02State();
}

class _Screen02State extends State<Screen02> with TickerProviderStateMixin {
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
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 22,
                color: Colors.black54,
              ),
              hintText: 'Search in Bannu Beef Pulao - Thokar',
              hintStyle: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey[600],
              ),
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
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < 5; i++)
            ItemCard(
              title: 'Beef Biryani',
              subtitle: 'Spicy and Delicious',
              price: 'Rs. 899',
              oldPrice: 'Rs. 1099',
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
  final String? oldPrice;

  const ItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleCart(context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        price,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      if (oldPrice != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          oldPrice!,
                          style: GoogleFonts.poppins(
                            fontSize: 12.5,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.fastfood,
                    size: 38,
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.add, size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handleCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: DraggableScrollableSheet(
            initialChildSize: 0.88,
            maxChildSize: 0.95,
            expand: false,
            builder: (_, controller) => SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Header
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      color: const Color(0xFFF5F5F5),
                      child: const Icon(
                        Icons.fastfood,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Subtitle
                        Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Price Row
                        Row(
                          children: [
                            Text(
                              price,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            if (oldPrice != null) ...[
                              const SizedBox(width: 8),
                              Text(
                                oldPrice!,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Description
                        Text(
                          "Serves 1–2 Persons. Beef Pulao is a rich Pakistani rice dish cooked with beef, stock, and spices.",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            height: 1.5,
                            color: Colors.grey[800],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Section Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Frequently bought together",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Other customers also ordered these",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.5,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Optional',
                              style: GoogleFonts.poppins(
                                fontSize: 12.5,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        // List of Addons with Checkbox
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.grey.shade200,
                                  child: const Icon(
                                    Icons.fastfood,
                                    color: Colors.grey,
                                    size: 22,
                                  ),
                                ),
                                title: Text(
                                  'Beef Pulao',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      'Rs. 2,999',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Rs. 3,999',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Checkbox(
                                  value: true,
                                  onChanged: (val) {},
                                  checkColor: Colors.white,
                                  activeColor: AppColors.primary,
                                  fillColor: MaterialStateProperty.all(
                                    AppColors.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        // Quantity & Add to Cart
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Quantity Box
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade100,
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    '1',
                                    style: TextStyle(fontSize: 15, color: Colors.black),
                                  ),
                                  const SizedBox(width: 12),
                                  InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Add to Cart Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Add to Cart',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
