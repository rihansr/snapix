import 'dart:io';
import 'package:core/router/routes.dart';
import 'package:core/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared/presentation/widgets/clipper_widget.dart';
import '../../data/models/album_model.dart';

class AlbumGrid extends StatefulWidget {
  final AlbumModel album;
  const AlbumGrid({
    super.key,
    required this.album,
  });

  @override
  State<AlbumGrid> createState() => _AlbumGridState();
}

class _AlbumGridState extends State<AlbumGrid> {
  ImageProvider<Object>? image;

  @override
  void initState() {
    super.initState();
    final photo = widget.album.photos?.firstOrNull;
    if (photo != null) image = FileImage(File(photo));
  }

  @override
  void didChangeDependencies() {
    if (image != null) {
      precacheImage(
        image!,
        context,
        size: const Size(172, 172),
      );
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => context.pushNamed(
        Routes.album,
        pathParameters: {'id': widget.album.folder ?? ''},
      ),
      borderRadius: BorderRadius.circular(10),
      child: Clipper(
        color: theme.colorScheme.surface,
        radius: 10,
        padding: const EdgeInsets.all(12),
        backdrop: image == null
            ? null
            : DecorationImage(
                image: image!,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.secondary.withOpacity(0.5),
                  BlendMode.srcATop,
                ),
              ),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.album.folder ?? '',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              string.of(context).photos(widget.album.photos?.length ?? 0),
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
