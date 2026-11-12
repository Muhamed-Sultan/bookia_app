import 'package:bookia_app/core/routes/app_routes.dart';
import 'package:bookia_app/core/services/locale/shared_local.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/core/utils/validator/app_constants.dart';
import 'package:bookia_app/core/widgets/app_botton.dart';
import 'package:bookia_app/feature/profile/data/models/profile_model.dart';
import 'package:bookia_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia_app/feature/profile/presentation/ui/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Text('Profile', style: AppTextStyle.mainText),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: AppColors.backgroundColor,
                            title: Text('Log Out'),
                            content: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AppBotton(
                                      title: "Confirm",
                                      onTap: () {
                                        SharedLocal.prefs?.remove(
                                          AppConstants.Token,
                                        );
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          AppRoutes.LoginScreen,
                                          (e) => false,
                                        );
                                      },
                                      textColor: AppColors.blackColor,
                                      bgColor: Colors.transparent,
                                    ),
                                  ),
                                  7.horizontalSpace,
                                  Expanded(
                                    child: AppBotton(
                                      title: "Cancel",
                                      onTap: () => Navigator.pop(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.logout_outlined),
                    ),
                  ),
                ],
              ),
              23.verticalSpace,
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is GetProfileLoading) {
                    return CircularProgressIndicator();
                  } else if (state is GetProfileSuccess) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundImage: Image.network(
                            state.profileResponse?.data?.image ?? "",
                          ).image,
                        ),
                        13.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.profileResponse?.data?.name ?? ""),
                              Text(state.profileResponse?.data?.email ?? ""),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Text("Error");
                  }
                },
              ),
              35.verticalSpace,
              Expanded(
                child: ListView.separated(
                  itemCount: CardModel.profileItems.length,
                  separatorBuilder: (_, _) => 12.verticalSpace,
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
