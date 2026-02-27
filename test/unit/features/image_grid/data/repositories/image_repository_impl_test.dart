import 'package:elisoft/core/constants/app_urls.dart';
import 'package:elisoft/features/image_grid/data/repositories/image_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ImageRepositoryImpl', () {
    late ImageRepositoryImpl repository;

    setUp(() {
      repository = ImageRepositoryImpl();
    });

    test('should create a valid Picsum URL from seed', () {
      // Arrange
      const int seed = 12345;

      // Act
      final String result = repository.createImageUrlFromSeed(seed);

      // Assert
      expect(
        result,
        '${AppUrls.picsumBaseUrl}/seed/$seed${AppUrls.picsumSquare200Path}',
      );
    });

    test('should create different URLs for different seeds', () {
      // Arrange
      const int firstSeed = 1;
      const int secondSeed = 2;

      // Act
      final String firstUrl = repository.createImageUrlFromSeed(firstSeed);
      final String secondUrl = repository.createImageUrlFromSeed(secondSeed);

      // Assert
      expect(firstUrl, isNot(equals(secondUrl)));
    });
  });
}

