import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../views/photo_preview_view.dart';

class PhotoGrid extends StatelessWidget {
  final String path;
  const PhotoGrid({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(5);
    return InkWell(
      onTap: () => showCupertinoModalPopup(
        context: context,
        builder: (_) => PhotoPreview(path: path),
      ),
      borderRadius: radius,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.file(
          File(path),
          width: 128,
          height: 128,
          fit: BoxFit.cover,
          cacheWidth: 128,
          cacheHeight: 128,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
