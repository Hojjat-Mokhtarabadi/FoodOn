import 'package:firebase_storage/firebase_storage.dart';
import 'package:foodon/src/domain/entity/entity.dart';

abstract class FirebaseStorageApi {
  Future<List<FirebaseFileModel>> getFoodImages(String path);
  Future<List<FirebaseFileModel>> getFoodImagesById(String path, List<int> ids);
}

class FirebaseStorageApiImpl extends FirebaseStorageApi {
  Future<List<String>> getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  Future<List<FirebaseFileModel>> getFoodImages(String path) async {
    List<Reference> refs;
    final result = await FirebaseStorage.instance.ref(path).listAll();
    refs = result.items;
    refs.sort((a, b) {
      return int.parse(a.name.substring(0, a.name.indexOf('.')))
          .compareTo(int.parse(b.name.substring(0, b.name.indexOf('.'))));
    });
    final urls = await getDownloadLinks(refs);
    return urls
        .asMap()
        .map(
          (index, url) {
            final ref = refs[index];
            final name = ref.name;
            final file = FirebaseFileModel(ref: ref, name: name, url: url);
            return MapEntry(index, file);
          },
        )
        .values
        .toList();
  }

  @override
  Future<List<FirebaseFileModel>> getFoodImagesById(
      String path, List<int> ids) async {
    List<Reference> refs = [];
    for (int i = 0; i < ids.length; i++) {
      print('here');
      final instance = FirebaseStorage.instance;
      final Reference ref = instance.ref('$path/${ids[i]}.jpg');
      print(ref.name);
      refs.add(ref);
      print(ref);
      print(refs);
    }
    print(refs);
    final urls = await getDownloadLinks(refs);
    return urls
        .asMap()
        .map(
          (index, url) {
            final ref = refs[index];
            final name = ref.name;
            final file = FirebaseFileModel(ref: ref, name: name, url: url);
            return MapEntry(index, file);
          },
        )
        .values
        .toList();
  }
}
