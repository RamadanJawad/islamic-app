import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurahWidget extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  final String text;
  const SurahWidget({super.key, required this.index, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[100]!,
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  spreadRadius: 1),
            ],
            borderRadius: BorderRadius.circular(15).r),
        child: Row(
          children: [
            Container(
              width: 35.w,
              height: 35.h,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10).r),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.play_fill,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: "ibm", fontSize: 17.sp, color: Colors.black),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
