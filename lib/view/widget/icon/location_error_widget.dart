import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/constant/color.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
              "assets/images/location.png",
              width: double.infinity,
              height: 200.h,
            ),
           SizedBox(
            height: 30.h,
          ),
          Text(
            error!,
            textAlign: TextAlign.center,
            style:  TextStyle(
                color: ColorCode.secondaryColor,
                fontSize: 19.sp,
                fontFamily: "Cairo"),
          ),
           SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            child: const Text("حاول مجددا",style: TextStyle(fontFamily: "Cairo"),),
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10),backgroundColor: ColorCode.mainColor),
            onPressed: () {
              if (callback != null) callback!();
            },
          )
        ],
      ),
    );
  }
}
