import 'package:flutter/material.dart';

class GrayedOut extends StatelessWidget {
  final Widget child;
  final bool grayedOut;
  final bool showLoading;

  const GrayedOut({
    required this.child,
    this.grayedOut = true,
    this.showLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return grayedOut
        ? Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.3,
                child: IgnorePointer(
                  child: child,
                ),
              ),
              if (showLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          )
        : child;
  }
}
