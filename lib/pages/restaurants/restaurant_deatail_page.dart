import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/res_app_bar.dart';
import 'widgets/res_heaader.dart';

class RestaurantDeatailPage extends StatefulWidget {
  final String imgpath;
  final String title;
  final double rating;
  final int reviewsCount;
  const RestaurantDeatailPage({
    super.key,
    required this.imgpath,
    required this.title,
    required this.rating,
    required this.reviewsCount,
  });

  @override
  State<RestaurantDeatailPage> createState() => _RestaurantDeatailPageState();
}

class _RestaurantDeatailPageState extends State<RestaurantDeatailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: ResAppBar(imgpath: widget.imgpath),
        body: Column(
          spacing: 5,
          children: [
            ResHeaader(
              title: widget.title,
              rating: widget.rating,
              reviewsCount: widget.reviewsCount,
              duration: '15-30 min',
              deliveryFee: 129,
              deliveryFeeWithSaver: 109,
              minOrder: 249,
              discount: {
                'label': 'Rs 595 OFF',
                'title': 'Limited Time Offer!',
                'description': 'Get Rs 595 off on all orders above Rs. 500',
              },
              voucher: {
                'acceptsVoucher': true,
                'title': 'Free Delivery',
                'description': 'Free delivery on orders above Rs. 595',
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, -2),
                    blurRadius: 1,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  //search bar
                  Container(
                    height: 56.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40.h,
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.search,
                                  size: 20.sp,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 6.w),
                                Expanded(
                                  child: TextField(
                                    cursorColor: AppColors.primary,
                                    style: TextStyle(fontSize: 12.sp),
                                    decoration: InputDecoration(
                                      hintText: "Search for restaurants",
                                      hintStyle: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 14.sp,
                                      ),
                                      border: InputBorder.none,
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
