import 'dart:convert';
import 'dart:io';

const String _defaultLocaleFile = 'lib/l10n/app_en.arb';
const String _targetLocaleFile = 'lib/l10n/app_vi.arb';

void main() {
  final File sourceFile = File(_defaultLocaleFile);
  final File targetFile = File(_targetLocaleFile);

  if (!sourceFile.existsSync()) {
    stderr.writeln('Missing source ARB file: $_defaultLocaleFile');
    exitCode = 1;
    return;
  }

  if (!targetFile.existsSync()) {
    stderr.writeln('Missing target ARB file: $_targetLocaleFile');
    exitCode = 1;
    return;
  }

  final Map<String, dynamic> source =
      _readArbAsMap(sourceFile.readAsStringSync());
  final Map<String, dynamic> target =
      _readArbAsMap(targetFile.readAsStringSync());

  int insertedCount = 0;

  for (final MapEntry<String, dynamic> entry in source.entries) {
    final String key = entry.key;
    if (_isMetaKey(key)) {
      continue;
    }

    if (!target.containsKey(key)) {
      target[key] = entry.value;
      insertedCount++;
    }

    final String metadataKey = '@$key';
    if (source.containsKey(metadataKey) && !target.containsKey(metadataKey)) {
      target[metadataKey] = source[metadataKey];
    }
  }

  final String updatedContent =
      const JsonEncoder.withIndent('  ').convert(target);
  targetFile.writeAsStringSync('$updatedContent\n');

  stdout.writeln(
    'Done. Added $insertedCount missing translation key(s) to '
    '$_targetLocaleFile',
  );
}

Map<String, dynamic> _readArbAsMap(String rawContent) {
  final Object? decoded = jsonDecode(rawContent);
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('ARB content is not a JSON object.');
  }
  return decoded;
}

bool _isMetaKey(String key) {
  return key.startsWith('@');
}

