
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/helpers/pick_image_helper/pick_image_helper.dart';

class PickImageHelperMock extends Mock implements PickImageHelper {}

class XfileMock extends Mock implements XFile {}

void main() {
  late PickImageHelperMock pickImageHelperMock;
  late XfileMock xfileMock;
  setUp(
    () {
      pickImageHelperMock = PickImageHelperMock();
      xfileMock = XfileMock();
    },
  );
  test('Deve retornar o xfile correto para galeria', () async {
    when(
      () => pickImageHelperMock.getImage(imageFrom: ImageFrom.gallery),
    ).thenAnswer((_) async => xfileMock);
    final sut =
        await pickImageHelperMock.getImage(imageFrom: ImageFrom.gallery);
    expect(sut, xfileMock);
  });
  test('Deve retornar o xfile correto para galeria', () async {
    when(
      () => pickImageHelperMock.getImage(imageFrom: ImageFrom.camera),
    ).thenAnswer((_) async => xfileMock);
    final sut =
        await pickImageHelperMock.getImage(imageFrom: ImageFrom.camera);
    expect(sut, xfileMock);
  });
}
