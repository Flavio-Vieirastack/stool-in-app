import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../exports/app_exports.dart';


mixin ResponsiveHelperMixin {
  num responsiveHeight({
    required num defaultMobileHeight,
    required num defaultMobileSmallSizeHeight,
    required num defaultTabletHeight,
    required BoxConstraints constraints,
  }) {
    if (constraints.maxWidth <= AppSizesContants.kMobileSmallBreakpoint) {
      return defaultMobileSmallSizeHeight;
    } else if (constraints.maxWidth > AppSizesContants.kMobileSmallBreakpoint &&
        constraints.maxWidth <= AppSizesContants.kMobileBreakpoint) {
      return defaultMobileHeight;
    } else if (constraints.maxWidth > AppSizesContants.kMobileBreakpoint &&
        constraints.maxWidth <= AppSizesContants.kTabletBreakpoint) {
      log('default tablet size height loaded');
      return defaultTabletHeight;
    } else {
      return defaultTabletHeight;
    }
  }

  num responsiveWidth({
    required num defaultMobileWidth,
    required num defaultMobileSmallSizeWidth,
    required num defaultTabletWidth,
    required BoxConstraints constraints,
  }) {
    if (constraints.maxWidth <= AppSizesContants.kMobileSmallBreakpoint) {
      return defaultMobileSmallSizeWidth;
    } else if (constraints.maxWidth > AppSizesContants.kMobileSmallBreakpoint &&
        constraints.maxWidth <= AppSizesContants.kMobileBreakpoint) {
      return defaultMobileWidth;
    } else if (constraints.maxWidth > AppSizesContants.kMobileBreakpoint &&
        constraints.maxWidth <= AppSizesContants.kTabletBreakpoint) {
      log('default tablet width loaded');
      return defaultTabletWidth;
    } else {
      return defaultTabletWidth;
    }
  }
}
