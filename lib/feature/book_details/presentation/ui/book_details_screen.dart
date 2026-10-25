import 'package:bookia_app/core/widgets/icon_back.dart';
import 'package:bookia_app/feature/book_details/presentation/cubit/book_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
          child: BlocBuilder<BookDetailsCubit, BookDetailsState>(
            builder: (context, state) {
              if (state is BookDetailsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BookDetailsSuccess) {
                return Column(
                  children: [
                    IconBack(),
                    20.verticalSpace,
                    Image.network(state.data?.image ?? ""),
                    20.verticalSpace,
                    Text(state.data?.name ?? ""),
                    20.verticalSpace,
                    Text(state.data?.description ?? ""),
                  ],
                );
              } else {
                return Text('Error');
              }
            },
          ),
        ),
      ),
    );
  }
}
