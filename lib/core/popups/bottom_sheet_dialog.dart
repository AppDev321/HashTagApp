import 'package:flutter/material.dart';

void showBottomSheetDialog(BuildContext context, Widget child, {double padding = 20.0}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4, // Set initial height to 40% of screen height
        minChildSize: 0.3, // Minimum height
        maxChildSize: 0.9, // Maximum height
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.all(padding),
            child: SingleChildScrollView(
              controller: scrollController,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: child, // Your dynamic content here
                ),
              ),
          );
        },
      );
    },
  );
}
