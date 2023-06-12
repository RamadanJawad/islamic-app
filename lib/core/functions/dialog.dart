import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';

showDialogQuiz() {
  Get.defaultDialog(
    title: "شروط المسابقة",
    titleStyle: const TextStyle(
      fontFamily: "ibm",
    ),
    middleTextStyle: const TextStyle(
      fontFamily: "ibm",
    ),
    content: const Text(
      '''
•	تحتوى المسابقة على عشرة مستويات , كل مستوى عشر أسئلة.
•	عند الإجابة على كل سؤال بشكل صحيح ستحصل على ثلاث نقاط , وعند الإجابة الخاطئة سينقص درجتين.
•	عند الانتقال الى المستوى التالي يجب ان تكون قد حصلت بالمستوى السابق على 15 نقطة كحد أدنى من اصل 30.
•	لديك ثلاث خيارات مساعدة يمكنك الاستعانة بهم مرة واحدة فقط في كل مستوى.
•	الوسيلة الأولى : حذف اجابتين (ناقص 2 نقاط ).
•	الوسيلة الثانية : استطلاع الرأي (ناقص 2 نقاط).
•	الوسيلة الثالثة : إعادة ضبط المؤقت (ناقص 2 نقاط).
•	عند الانتهاء من المسابقة يمكنك مشاركة النتيجة مع أصدقائك على مواقع التواصل الاجتماعي.
•	يمكنك العودة الى المستوى السابق والاستمرار في المسابقة من حيث توقفت.
•	يمكنك الاستفادة من النقاط التي حصلت عليها في شراء الوسائل المساعدة.
                        ''',
      textDirection: TextDirection.rtl,
      style: TextStyle(fontFamily: "ibm"),
    ),
    cancel: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorCode.mainColor),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          "اغلاق",
          style: TextStyle(fontFamily: "ibm"),
        ),
      ),
    ),
  );
}
