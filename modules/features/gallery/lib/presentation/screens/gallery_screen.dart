import 'package:core/router/routes.dart';
import 'package:core/styles/dimen.dart';
import 'package:core/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared/presentation/widgets/widgets.dart';
import 'package:shared/utils/utils.dart'
    show BlocConsumer, ReadContext, WatchContext;
import '../bloc/gallery_bloc.dart';
import '../components/album_grid_item.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    context.read<GalleryBloc>().add(const GalleryEvent.albums());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          string.of(context).albums,
          style: theme.textTheme.headlineLarge,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.pushNamed(Routes.settings),
          ),
        ],
      ),
      body: BlocConsumer<GalleryBloc, GalleryState>(
        bloc: context.watch<GalleryBloc>(),
        listener: (BuildContext context, GalleryState state) {},
        builder: (context, state) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              dimen.screenBorderSpace,
              0,
              dimen.screenBorderSpace,
              dimen.bottom(16, false),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: state.albums.length,
            itemBuilder: (BuildContext context, int index) {
              var album = state.albums[index];
              return AlbumGrid(
                key: ValueKey('album_$index'),
                album: album,
              );
            },
          );
        },
      ),
    );
  }
}
