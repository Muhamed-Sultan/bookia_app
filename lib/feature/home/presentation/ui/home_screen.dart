import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/feature/home/data/models/book_model.dart';
import 'package:bookia_app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_app/feature/home/presentation/ui/widgets/book_items.dart';
import 'package:bookia_app/feature/home/presentation/ui/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeAppBar(),
              25.verticalSpace,
              Text('Best Saller', style: AppTextStyle.mainText),
              25.verticalSpace,
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is GetBestsellerBooksLoading) {
                    return Expanded(
                      child: Skeletonizer(
                        enabled: true,

                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .49,
                                mainAxisSpacing: 14.h,
                                crossAxisSpacing: 18.w,
                              ),
                          itemBuilder: (context, index) => BookItems(
                            product: Products(
                              name: "name test",
                              price: "231",
                              image:
                                  "https://i.pinimg.com/1200x/60/a6/e2/60a6e2b0776d1d6735fce5ae7dc9b175.jpg",
                            ),
                          ),
                          itemCount: 6,
                        ),
                      ),
                    );
                  } else if (state is GetBestsellerBooksSuccess) {
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .49,
                          mainAxisSpacing: 14.h,
                          crossAxisSpacing: 18.w,
                        ),
                        itemBuilder: (context, index) =>
                            BookItems(product: state.product[index]),
                        itemCount: state.product.length,
                      ),
                    );
                  } else {
                    return Text('Error');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
