import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/feature/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItems extends StatelessWidget {
  final Products? product;
  const BookItems({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    debugPrint('Image URL: ${product?.image}');
    return Container(
      padding: EdgeInsets.all(22.r),
      width: 163.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
            child: Image.network(
              product?.image ?? "",
              width: 140.w,
              height: 175.h,
              fit: BoxFit.cover,
            ),
          ),
          20.verticalSpace,
          Text(
            product?.name ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          8.verticalSpace,
          Row(
            children: [
              Expanded(child: Text(product?.price ?? "")),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart, size: 20.r),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
