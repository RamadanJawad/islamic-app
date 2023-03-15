import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/qibla_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/view/widget/icon/location_error_widget.dart';

class QiblaCompass extends StatelessWidget {
  const QiblaCompass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QiblaController>(builder: (controller) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: controller.stream,
          builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CupertinoActivityIndicator();
            }
            if (snapshot.data!.enabled == true) {
              switch (snapshot.data!.status) {
                case LocationPermission.always:
                case LocationPermission.whileInUse:
                  return QiblahCompassWidget();

                case LocationPermission.denied:
                  return LocationErrorWidget(
                    error: "Location service permission denied",
                    callback: controller.checkLocationStatus,
                  );
                case LocationPermission.deniedForever:
                  return LocationErrorWidget(
                    error: "Location service Denied Forever !",
                    callback: controller.checkLocationStatus,
                  );

                default:
                  return Container();
              }
            } else {
              return LocationErrorWidget(
                error: "لمعرفة اتجاه القبلة يرجى تفعيل خاصية الموقع من الهاتف",
                callback: controller.checkLocationStatus,
              );
            }
          },
        ),
      );
    });
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _kaabaSvg = SvgPicture.asset('assets/svg/4.svg');
  QiblahCompassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        }
        final qiblahDirection = snapshot.data!;
        var angle = ((qiblahDirection.qiblah) * (pi / 180) * -1);
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: angle,
              child: SvgPicture.asset('assets/svg/5.svg', // compass
                  color: ColorCode.mainColor),
            ),
            _kaabaSvg,
            SvgPicture.asset('assets/svg/3.svg', //needle
                color: ColorCode.mainColor),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "قم بمطابقة رأس السهمين \n من خلال تحريك الهاتف يمينا او شمالا",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Cairo"),
              ),
            )
          ],
        );
      },
    );
  }
}
