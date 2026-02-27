/// Contract for image-related data operations.
abstract class ImageRepository {
  /// Returns a Picsum image URL generated from [seed].
  String createImageUrlFromSeed(int seed);
}
