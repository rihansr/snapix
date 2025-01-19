part of 'gallery_bloc.dart';

@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.albums() = _Albums;
  const factory GalleryEvent.photos({required String id}) = _Photos;
}
