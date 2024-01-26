import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    this.height,
    this.width,
    this.onTap,
  });

  final double? height;
  final double? width;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }
}
