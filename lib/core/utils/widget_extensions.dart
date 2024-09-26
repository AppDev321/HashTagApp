
import 'package:flutter/material.dart';
import 'package:hashtag/core/widgets/custom_shimmer_widget.dart';

import 'package:flutter/material.dart';

extension CustomSizeBox on SizedBox {
  // Method to create a SizedBox with custom width and height
  static SizedBox custom({
    required double width,
    required double height,
    required Widget child,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }

  // Creates a small sized box
  static SizedBox small({required Widget child}) {
    return custom(width: 50.0, height: 20.0, child: child);
  }

  // Creates a medium sized box
  static SizedBox medium({required Widget child}) {
    return custom(width: 100.0, height: 50.0, child: child);
  }

  // Creates a large sized box
  static SizedBox large({required Widget child}) {
    return custom(width: 150.0, height: 100.0, child: child);
  }

  static SizedBox width(double width) {
    return SizedBox(width: width,);
  }

  static SizedBox height(double height) {
    return SizedBox(height: height,);
  }
}


extension WidgetsExtensions on Widget {
  Widget wrapWithLoading(ValueNotifier<bool> valueNotifier) {
    return ValueListenableBuilder<bool>(
      valueListenable: valueNotifier,
      builder: (_, loading, __) {
        return loading
            ? const Center(
          child: CircularProgressIndicator.adaptive(),
        )
            : this;
      },
    );
  }
  Widget wrapWithLoadingBool(bool valueNotifier) {
    return valueNotifier
        ? const Center(
      child: CircularProgressIndicator.adaptive(),
    )
        : this;
  }

  Widget wrapWithListViewSkeleton(bool valueNotifier) {
    return valueNotifier
        ? Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true, // Add this line
          primary: false,   // Add this line
          itemBuilder: (context, index) {
            return const CustomShimmer(height: 100);
          },
          itemCount: 10,
        ),
      ),
    )
        : this;
  }
}