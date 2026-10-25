import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/feature/profile/data/models/card_model.dart';
import 'package:bookia_app/feature/profile/presentation/ui/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Text("Profile", style: AppTextStyle.mainText),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ],
              ),
              23.verticalSpace,
              Row(
                children: [
                  CircleAvatar(radius: 50.r, backgroundColor: Colors.grey),
                  13.horizontalSpace,
                  Column(
                    children: [
                      Text("UserName", style: AppTextStyle.mainText),
                      Text(
                        "user.email",
                        style: AppTextStyle.hintText.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              35.verticalSpace,
              Expanded(
                child: ListView.separated(
                  itemCount: CardModel.profileItems.length,
                  separatorBuilder: (_, __) => 12.verticalSpace,
                  itemBuilder: (context, index) {
                    return ProfileCard(text: CardModel.profileItems[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
