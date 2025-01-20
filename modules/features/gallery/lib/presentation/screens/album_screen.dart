import 'package:core/styles/dimen.dart';
import 'package:flutter/material.dart';
import 'package:shared/presentation/widgets/widgets.dart';
import 'package:shared/utils/constants.dart';
import 'package:shared/utils/utils.dart'
    show BlocConsumer, ReadContext, WatchContext;
import '../bloc/gallery_bloc.dart';
import '../components/photo_grid_item.dart';

class AlbumScreen extends StatefulWidget {
  final String id;
  const AlbumScreen({
    super.key,
    required this.id,
  });

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<GalleryBloc>().add(const GalleryEvent.loadMore());
      }
    });

    context
        .read<GalleryBloc>()
        .add(GalleryEvent.photos(id: widget.id, limit: kLoadMoreLimit));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(widget.id),
      ),
      body: BlocConsumer<GalleryBloc, GalleryState>(
        bloc: context.watch<GalleryBloc>(),
        listener: (BuildContext context, GalleryState state) {},
        builder: (context, state) {
          return GridView.builder(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              dimen.screenBorderSpace,
              0,
              dimen.screenBorderSpace,
              dimen.bottom(16, false),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemCount: state.photos.length,
            itemBuilder: (BuildContext context, int index) {
              var photo = state.photos[index];
              return PhotoGrid(
                key: ValueKey('photo_$index'),
                path: photo,
              );
            },
          );
        },
      ),
    );
  }
}
