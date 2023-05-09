import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_sliders/src/slider_base.dart';
import 'package:syncfusion_flutter_sliders/src/constants.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomTooltipShape extends SfTooltipShape {
  const CustomTooltipShape();
  bool _hasTooltipOverlapStroke(RenderBaseSlider parentBox) {
    return parentBox.showOverlappingTooltipStroke;
  }

  void _drawPaddleTooltip(
      RenderBox parentBox,
      TextPainter textPainter,
      double minPaddleTopCircleRadius,
      double neckDifference,
      SfSliderThemeData sliderThemeData,
      double defaultThumbRadius,
      double minBottomNeckRadius,
      double textPadding,
      Offset offset,
      double moveNeckValue,
      Offset thumbCenter,
      Rect trackRect,
      PaintingContext context,
      Animation<double> animation,
      Paint? paint) {
    final double thumbRadius = (parentBox as RenderBaseSlider)
            .thumbShape
            .getPreferredSize(sliderThemeData)
            .width /
        2;
    final double paddleTopCircleRadius =
        textPainter.height > minPaddleTopCircleRadius
            ? textPainter.height
            : minPaddleTopCircleRadius;
    final double topNeckRadius = paddleTopCircleRadius - neckDifference;
    final double bottomNeckRadius = thumbRadius > defaultThumbRadius
        ? thumbRadius - neckDifference * 2
        : minBottomNeckRadius;
    final double halfTextWidth = textPainter.width / 2 + textPadding;
    final double paddleTopCircleX = halfTextWidth > paddleTopCircleRadius
        ? halfTextWidth - paddleTopCircleRadius
        : 0;
    final double minPaddleWidth =
        paddleTopCircleRadius + topNeckRadius + neckDifference / 2;
    final Offset topNeckCenter = Offset(
        topNeckRadius + neckDifference / 2, -offset.dy - bottomNeckRadius);
    final Offset paddleTopCircleCenter = Offset(
        paddleTopCircleX,
        -paddleTopCircleRadius * (1.0 - moveNeckValue) -
            topNeckRadius -
            offset.dy -
            bottomNeckRadius);
    final Offset bottomNeckCenter = Offset(
        bottomNeckRadius + neckDifference / 2,
        -thumbRadius - bottomNeckRadius * (1.0 - moveNeckValue));
    final double leftShiftWidth = thumbCenter.dx - offset.dx - halfTextWidth;
    double shiftPaddleWidth = leftShiftWidth < 0 ? leftShiftWidth : 0;
    final double rightEndPosition =
        trackRect.right + trackRect.left - offset.dx;
    shiftPaddleWidth = thumbCenter.dx + halfTextWidth > rightEndPosition
        ? thumbCenter.dx + halfTextWidth - rightEndPosition
        : shiftPaddleWidth;
    final double leftPaddleWidth =
        paddleTopCircleRadius + paddleTopCircleCenter.dx + shiftPaddleWidth;
    final double rightPaddleWidth =
        paddleTopCircleRadius + paddleTopCircleCenter.dx - shiftPaddleWidth;
    final double moveLeftTopNeckY = leftPaddleWidth > paddleTopCircleRadius
        ? leftPaddleWidth < minPaddleWidth
            ? (leftPaddleWidth - topNeckRadius) * moveNeckValue
            : paddleTopCircleRadius * moveNeckValue
        : 0;
    final double moveLeftTopNeckAngle = leftPaddleWidth > paddleTopCircleRadius
        ? leftPaddleWidth < minPaddleWidth
            ? moveLeftTopNeckY * math.pi / 180
            : 30 * math.pi / 180
        : 0;
    final double moveRightTopNeckY = rightPaddleWidth > paddleTopCircleRadius
        ? rightPaddleWidth < minPaddleWidth
            ? (rightPaddleWidth - topNeckRadius) * moveNeckValue
            : paddleTopCircleRadius * moveNeckValue
        : 0;
    final double moveRightTopNeckAngle =
        rightPaddleWidth > paddleTopCircleRadius
            ? rightPaddleWidth < minPaddleWidth
                ? moveRightTopNeckY * math.pi / 180
                : 30 * math.pi / 180
            : 0;
    final double leftNeckStretchValue = leftPaddleWidth < minPaddleWidth
        ? (1.0 - (leftPaddleWidth / minPaddleWidth))
        : 0;
    final double rightNeckStretchValue = rightPaddleWidth < minPaddleWidth
        ? (1.0 - (rightPaddleWidth / minPaddleWidth))
        : 0;
    final double adjustPaddleCircleLeftArcAngle =
        shiftPaddleWidth < 0 && leftPaddleWidth < minPaddleWidth
            ? (leftNeckStretchValue * (math.pi / 2 + moveLeftTopNeckAngle))
            : 0;
    final double adjustPaddleCircleRightArcAngle =
        shiftPaddleWidth > 0 && rightPaddleWidth < minPaddleWidth
            ? (rightNeckStretchValue * (math.pi / 2 + moveRightTopNeckAngle))
            : 0.0;
    final double adjustLeftNeckArcAngle =
        adjustPaddleCircleLeftArcAngle * (1.0 - moveNeckValue);
    final double adjustRightNeckArcAngle =
        adjustPaddleCircleRightArcAngle * (1.0 - moveNeckValue);

    final Path path = _getPaddleTooltipPath(
        neckDifference,
        topNeckCenter,
        moveRightTopNeckY,
        topNeckRadius,
        moveRightTopNeckAngle,
        adjustRightNeckArcAngle,
        paddleTopCircleCenter,
        shiftPaddleWidth,
        paddleTopCircleRadius,
        adjustPaddleCircleRightArcAngle,
        adjustPaddleCircleLeftArcAngle,
        moveLeftTopNeckY,
        moveLeftTopNeckAngle,
        adjustLeftNeckArcAngle,
        bottomNeckCenter,
        bottomNeckRadius,
        thumbRadius,
        sliderThemeData);

    context.canvas.save();
    context.canvas.translate(thumbCenter.dx, thumbCenter.dy);
    context.canvas.scale(animation.value);
    final Paint strokePaint = Paint();
    if (_hasTooltipOverlapStroke(parentBox) &&
        sliderThemeData is SfRangeSliderThemeData &&
        sliderThemeData.tooltipBackgroundColor != Colors.transparent) {
      strokePaint
        ..color = sliderThemeData.overlappingTooltipStrokeColor!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
    }
    // This loop is used to avoid the improper rendering of tooltips in
    // web html rendering.
    else {
      strokePaint
        ..color = Colors.transparent
        ..style = PaintingStyle.stroke;
    }
    context.canvas.drawPath(path, strokePaint);
    context.canvas.drawPath(path, paint!);
    textPainter.paint(
        context.canvas,
        Offset(-textPainter.width / 2 - shiftPaddleWidth,
            paddleTopCircleCenter.dy - textPainter.height / 2 + 30));
    context.canvas.restore();
  }

  Path _getPaddleTooltipPath(
      double neckDifference,
      Offset topNeckCenter,
      double moveRightTopNeckY,
      double topNeckRadius,
      double moveRightTopNeckAngle,
      double adjustRightNeckArcAngle,
      Offset paddleTopCircleCenter,
      double shiftPaddleWidth,
      double paddleTopCircleRadius,
      double adjustPaddleCircleRightArcAngle,
      double adjustPaddleCircleLeftArcAngle,
      double moveLeftTopNeckY,
      double moveLeftTopNeckAngle,
      double adjustLeftNeckArcAngle,
      Offset bottomNeckCenter,
      double bottomNeckRadius,
      double thumbRadius,
      SfSliderThemeData sliderThemeData) {
    final Path path = Path();
    path.moveTo(
        neckDifference / 2, topNeckCenter.dy + topNeckRadius * moveNeckValue);
    // Drawn top paddle shape.
    path.arcTo(
        Rect.fromCircle(
            center:
                Offset(topNeckCenter.dx, topNeckCenter.dy + moveRightTopNeckY),
            radius: topNeckRadius),
        math.pi,
        math.pi / 3 + moveRightTopNeckAngle - adjustRightNeckArcAngle,
        false);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(paddleTopCircleCenter.dx - shiftPaddleWidth,
                paddleTopCircleCenter.dy),
            radius: paddleTopCircleRadius),
        math.pi / 2 - adjustPaddleCircleRightArcAngle,
        -math.pi + adjustPaddleCircleRightArcAngle,
        false);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(-paddleTopCircleCenter.dx - shiftPaddleWidth,
                paddleTopCircleCenter.dy),
            radius: paddleTopCircleRadius),
        3 * math.pi / 2,
        -math.pi + adjustPaddleCircleLeftArcAngle,
        false);
    path.arcTo(
        Rect.fromCircle(
            center:
                Offset(-topNeckCenter.dx, topNeckCenter.dy + moveLeftTopNeckY),
            radius: topNeckRadius),
        5 * math.pi / 3 - moveLeftTopNeckAngle + adjustLeftNeckArcAngle,
        math.pi / 3 + moveLeftTopNeckAngle - adjustLeftNeckArcAngle,
        false);

    // Drawn bottom thumb shape.
    path.arcTo(
        Rect.fromCircle(
            center: Offset(-bottomNeckCenter.dx, bottomNeckCenter.dy),
            radius: bottomNeckRadius),
        0.0,
        math.pi / 3,
        false);
    path.arcTo(Rect.fromCircle(center: Offset.zero, radius: thumbRadius),
        3 * math.pi / 2, -math.pi, false);
    path.arcTo(Rect.fromCircle(center: Offset.zero, radius: thumbRadius),
        math.pi / 2, -math.pi, false);
    path.arcTo(
        Rect.fromCircle(center: bottomNeckCenter, radius: bottomNeckRadius),
        2 * math.pi / 3,
        math.pi / 3,
        false);
    return path;
  }

  /// Draws the tooltip based on the values passed in the arguments.
  @override
  void paint(PaintingContext context, Offset thumbCenter, Offset offset,
      TextPainter textPainter,
      {required RenderBox parentBox,
      required SfSliderThemeData sliderThemeData,
      required Paint paint,
      required Animation<double> animation,
      required Rect trackRect}) {
    _drawPaddleTooltip(
        parentBox,
        textPainter,
        minPaddleTopCircleRadius,
        neckDifference,
        sliderThemeData,
        defaultThumbRadius,
        minBottomNeckRadius,
        textPadding,
        offset,
        moveNeckValue,
        thumbCenter,
        trackRect,
        context,
        animation,
        paint);
  }
}
