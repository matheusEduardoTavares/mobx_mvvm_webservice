import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'fixture_reader.dart';

void main() {
  test('Should return json', () async {
    final json = FixtureReader.getJsonData('core/fixture/fixture_reader_test.json');

    expect(json, isNotEmpty);
  });

  test('Should return Map<String, dynamic>', () async {
    final data = FixtureReader.getData<Map<String, dynamic>>('core/fixture/fixture_reader_test.json');

    expect(data, isA<Map<String, dynamic>>());

    expect(data['id'], 1);
  });

  test('Should return List', () async {
    final data = FixtureReader.getData<List>('core/fixture/fixture_reader_list_test.json');

    expect(data, isNotEmpty);
    expect(data.length, 2);
    expect(data.first['id'], 1);
  });

  test('Should return FileSystemException if is File not found', () async {
    const call = FixtureReader.getData;

    expect(
      () => call('error.json'),
      throwsA(isA<FileSystemException>()),
    );
  });
}