import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/constant/color.dart';

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final bool visible;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const SeekBar({
    Key? key,
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
    required this.visible,
  }) : super(key: key);

  @override
  SeekBarState createState() => SeekBarState();
}

class SeekBarState extends State<SeekBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SliderTheme(
          data: _sliderThemeData.copyWith(
            thumbShape: HiddenThumbComponentShape(),
            activeTrackColor: ColorCode.mainColor.withOpacity(0.3),
            inactiveTrackColor: ColorCode.mainColor.withOpacity(0.1),
          ),
          child: ExcludeSemantics(
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(widget.bufferedPosition.inMilliseconds.toDouble(),
                  widget.duration.inMilliseconds.toDouble()),
              onChanged: (value) {
                setState(() {
                  _dragValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangeEnd != null) {
                  widget.onChangeEnd!(Duration(milliseconds: value.round()));
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        SliderTheme(
          data: _sliderThemeData.copyWith(
            inactiveTrackColor: Colors.transparent,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7.0),
          ),
          child: Slider(
            min: 0.0,
            thumbColor: ColorCode.mainColor,
            activeColor: ColorCode.mainColor,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble()),
            onChanged: (value) {
              setState(() {
                _dragValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(Duration(milliseconds: value.round()));
              }
            },
            onChangeEnd: (value) {
              if (widget.onChangeEnd != null) {
                widget.onChangeEnd!(Duration(milliseconds: value.round()));
              }
              _dragValue = null;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: _visible,
                child: Text(
                    RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                            .firstMatch("$position")
                            ?.group(1) ??
                        '$_remaining',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              Visibility(
                visible: _visible,
                child: Text(
                    RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                            .firstMatch("$duration")
                            ?.group(1) ??
                        '$_remaining',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool get _visible => widget.visible;
  Duration get _remaining => widget.duration - widget.position;
  Duration get duration => widget.duration;
  Duration get position => widget.position;
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

void showSliderDialog({
  required BuildContext context,
  required String title,
  required int divisions,
  required double min,
  required double max,
  String valueSuffix = '',
  required Stream<double> stream,
  required ValueChanged<double> onChanged,
}) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: StreamBuilder<double>(
        stream: stream,
        builder: (context, snapshot) => SizedBox(
          height: 100.0,
          child: Column(
            children: [
              Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                  style: const TextStyle(
                      fontFamily: 'Fixed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Slider(
                divisions: divisions,
                min: min,
                max: max,
                value: snapshot.data ?? 1.0,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
