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
        initialChildSize: 0.4,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.all(padding),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                controller: scrollController,
                child:child,
              ),
            ),
          );
        },
      );
    },
  );
}
