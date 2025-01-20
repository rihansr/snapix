import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared/presentation/widgets/widgets.dart';

class PhotoPreview extends StatelessWidget {
  final String path;
  const PhotoPreview({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: theme.colorScheme.secondary,
      appBar: CustomAppBar(
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: Center(
        child: Image.file(
          File(path),
          fit: BoxFit.cover,
          alignment: Alignment.center,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
