import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/setting_controller.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton(
      {super.key, required this.onChangeMethod, required this.value});

  final Function? onChangeMethod;

  final bool value;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return CupertinoSwitch(
        activeColor: Colors.green,
        
        value: value,
        onChanged: (val) {
          onChangeMethod!(val);
        },
      );
    });
  }
}
