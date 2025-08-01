import 'package:excellent_trade_app/config/components/round_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../Utils/constants/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedVariation = 'Full';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/placeholder.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      size: 60.sp,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Positioned(
                  top: 55.h,
                  left: 12.w,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        LucideIcons.x,
                        color: AppColors.primary,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chicken Biryani",
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.grey[700],
                      ),
                      children: [
                        const TextSpan(text: 'from '),
                        TextSpan(
                          text: 'Rs. 207.40 ',
                          style: GoogleFonts.poppins(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Rs. 344.09 ',
                          style: GoogleFonts.poppins(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text: '15% off',
                          style: GoogleFonts.poppins(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Serves 1 - 2 Person",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                  // SizedBox(height: 8.h),
                ],
              ),
            ),
            variationCardWidget(),
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Frequently bought together",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 25.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: .4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Optional',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Other customers also order these",
                    style: GoogleFonts.poppins(color: Colors.black54),
                  ),
                ],
              ),
            ),
            optionalItemsWidget("Sada Biryani", '180.20', '220.25'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.black,
                  ),
                  Text(
                    "View 2 more",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(thickness: 1, color: Colors.black12),
            ),
            SizedBox(height: 8.h),
            instructionWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 12,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 8.w),

            /// Quantity Control
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                counterWidget(Icons.remove, () {}),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    "1",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                counterWidget(Icons.add, () {}),
              ],
            ),

            /// Add to Cart Button
            SizedBox(
              height: 45.h,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined, size: 18),
                label: Text(
                  "Add to Cart",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                ),
              ),
            ),
            SizedBox(width: 4.w),
          ],
        ),
      ),
    );
  }

  Widget instructionWidget() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Special Instructions",
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          "Let us know if you have allergies or want us to avoid anything.",
          style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.black54),
        ),
        SizedBox(height: 18.h),
        TextField(
          maxLines: 3,
          cursorColor: Colors.black87,
          keyboardType: TextInputType.text,
          style: GoogleFonts.poppins(fontSize: 13.sp),
          decoration: InputDecoration(
            // labelText: 'Instruction',
            hintText: 'e.g. No mayo, extra spicy',
            hintStyle: GoogleFonts.poppins(color: Colors.grey),
            labelStyle: GoogleFonts.poppins(color: Colors.black87),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    ),
  );

  Widget counterWidget(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20.sp, color: Colors.black87),
      ),
    );
  }

  Widget variationCardWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.4),
            width: 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Variation",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                Container(
                  height: 25.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Required',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              'Select one',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 6.h),
            variationTile(title: 'Full', price: 'Rs. 355', original: 'Rs. 418'),
            variationTile(title: 'Half', price: 'Rs. 210', original: 'Rs. 290'),
          ],
        ),
      ),
    );
  }

  Widget variationTile({
    required String title,
    required String price,
    required String original,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Radio<String>(
        value: title,
        groupValue: selectedVariation,
        onChanged: (value) {
          setState(() {
            selectedVariation = value!;
          });
        },
        activeColor: AppColors.primary,
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary;
          }
          return Colors.black;
        }),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            price,
            style: GoogleFonts.poppins(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
          Text(
            original,
            style: GoogleFonts.poppins(
              decoration: TextDecoration.lineThrough,
              fontSize: 11.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget optionalItemsWidget(String title, String price, String original) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Column(
        children: List.generate(4, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Checkbox(
                value: index % 2 == 0 ? true : false,
                onChanged: (value) {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.r),
                ),
                // fillColor: MaterialStateProperty.all(AppColors.primary),
                activeColor: AppColors.primary,
                checkColor: Colors.white,
                side: BorderSide(color: AppColors.primary, width: 1.5),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),

              title: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      Icons.fastfood,
                      size: 24.sp,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    original,
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
