import 'package:elisoft/core/constants/app_urls.dart';
import 'package:elisoft/features/image_grid/domain/repositories/image_repository.dart';

/// Concrete repository for image URL generation.
class ImageRepositoryImpl implements ImageRepository {
  /// Builds a deterministic Picsum image URL from a numeric [seed].
  ///
  /// Different seeds produce different images while keeping a fixed size.
  @override
  String createImageUrlFromSeed(int seed) {
    return '${AppUrls.picsumBaseUrl}/seed/$seed${AppUrls.picsumSquare200Path}';
  }
}
