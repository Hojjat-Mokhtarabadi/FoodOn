import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoadingProgress({BuildContext context, GlobalKey key}) {
  showDialog(
      context: context,
      builder: (context) {
        return Stack(
          key: key,
          children: [
            Opacity(
              opacity: 0.01,
              child: const ModalBarrier(
                dismissible: false,
                color: Colors.black38,
              ),
            ),
            Center(child: CircularProgressIndicator())
          ],
        );
      });
}
