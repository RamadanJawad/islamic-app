import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(color: ColorCode.mainColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "عن التطبيق",
            style: TextStyle(
                fontFamily: "ibm",
                fontSize: 19.sp,
                fontWeight: FontWeight.w500),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Get.defaultDialog(
                title: "حول التطبيق",
                titleStyle: const TextStyle(fontFamily: "ibm"),
                middleTextStyle: const TextStyle(fontFamily: "ibm"),
                cancel: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorCode.mainColor),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("اغلاق",
                        style: TextStyle(fontFamily: "ibm"))),
                middleText:
                    ".تطبيق شفيع المسلم , هو تطبيق اسلامي مجاني مئة بالمئة ,لا يحتاج منك ان تكون متصل بالانترنت , يقدم خدمات اسلامية متعددة مثل عرض جميع الاذكار اليومية التى تخص حياة المسلم مع امكانية تنبيهه باشعار لقراءة اذكار الصباح والمساء بالاضافة الى قراءة القراءن و عرض اوقات الصلاة وتحديد اتجاه القبلة وخانة المسبحة الالكترونية , والعديد من الخدمات الرائعة التى تنفع المسلم في دينيه ودنياه , نسأل الله ان يكون هذا العمل شفيعا لنا يوم القيامة وان يتقبل منكم",
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/information.png",
                  width: 25.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "حول التطبيق",
                  style: TextStyle(
                      fontFamily: "ibm",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Share.share("تطبيق شفيع المسلم");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/share.png",
                  width: 23.w,
                  height: 23.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "نشر التطبيق",
                  style: TextStyle(
                      fontFamily: "ibm",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Uri gmailUrl = Uri.parse(
                  'mailto:shafiealmuslim@gmail.com?subject=الدعم الفني:&body=');
              _launchUrl(gmailUrl);
            },
            child: Row(
              children: [
                Image.asset(
                  "assets/images/technical_support.png",
                  width: 23.w,
                  height: 23.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "الدعم الفني",
                  style: TextStyle(
                      fontFamily: "ibm",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              var whatsapp = "+970598979132";
              var whatsappAndroid = Uri.parse(
                  "whatsapp://send?phone=$whatsapp&text=مرحبا كيف يمكنني مساعدتك؟ ");
              _launchUrl(whatsappAndroid);
            },
            child: Row(
              children: [
                Image.asset(
                  "assets/images/social_media.png",
                  width: 23.w,
                  height: 23.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "للاستفسار والتواصل",
                  style: TextStyle(
                      fontFamily: "ibm",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.w,
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
