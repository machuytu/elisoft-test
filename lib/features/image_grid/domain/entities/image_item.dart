import 'package:equatable/equatable.dart';

class ImageItem extends Equatable {
  const ImageItem({required this.id, required this.url});

  final int id;
  final String url;

  @override
  List<Object> get props => <Object>[id, url];
}
