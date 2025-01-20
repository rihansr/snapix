import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/data/models/album_model.dart';
import 'package:shared/utils/utils.dart';
import '../../domain/usecases/albums_usecase.dart';
part 'gallery_event.dart';
part 'gallery_state.dart';
part 'gallery_bloc.freezed.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  late final AlbumsUseCase _albumsUseCase;

  GalleryBloc(
    this._albumsUseCase,
  ) : super(const _GalleryState()) {
    on<GalleryEvent>((events, emit) async {
      await events.map(
        albums: (event) async => await _albums(event, emit),
        photos: (event) => _photos(event, emit),
        loadMore: (event) => _loadMore(event, emit),
      );
    });
  }

  _albums(_Albums event, Emitter<GalleryState> emitter) async {
    emitter(state.copyWith(status: Status.loading));
    final result = await _albumsUseCase.invoke();
    result.fold(
      (failure) => emitter(
        state.copyWith(status: Status.failure, albums: [], albumPhotos: []),
      ),
      (albums) => emitter(
        state.copyWith(
          status: Status.success,
          albums: albums,
        ),
      ),
    );
  }

  _photos(_Photos event, Emitter<GalleryState> emitter) {
    final allPhotos =
        state.albums.firstWhereOrNull((e) => e.folder == event.id)?.photos ??
            [];
    final limit = event.limit ?? state.limit;
    final photos = allPhotos.take(limit).toList();
    final maxPage =
        (allPhotos.length ~/ limit) + (allPhotos.length % limit > 0 ? 1 : 0);

    emitter(
      state.copyWith(
        albumPhotos: allPhotos,
        photos: photos,
        limit: limit,
        currentPage: 1,
        minPage: 1,
        maxPage: maxPage,
      ),
    );
  }

  _loadMore(_LoadMore event, Emitter<GalleryState> emitter) {
    if (state.currentPage == state.maxPage) return;
    final startIndex = state.currentPage * state.limit;
    final newPhotos =
        state.albumPhotos.skip(startIndex).take(state.limit).toList();
    if (newPhotos.isEmpty) return;
    emitter(
      state.copyWith(
        photos: [...state.photos, ...newPhotos],
        currentPage: startIndex + 1,
      ),
    );
  }
}
