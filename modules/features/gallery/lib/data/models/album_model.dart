import 'package:json_annotation/json_annotation.dart';
import 'package:shared/utils/utils.dart';
part 'album_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AlbumModel extends Equatable {
  @JsonKey(name: "folderName")
  final String? folder;
  @JsonKey(name: "images")
  final List<String>? photos;

  const AlbumModel({
    this.photos,
    this.folder,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);

  static List<AlbumModel> fromJsonList(List<dynamic> json) =>
      json.map((e) => AlbumModel.fromJson(e)).toList();

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        folder,
        photos,
      ];
}
