import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_list/app/core/utils/keys.dart';

class StorageService extends GetxService{

  late GetStorage getStorage;

  Future<StorageService> init() async {
    getStorage = GetStorage();
    // await getStorage.write(taskKey, []);
    await getStorage.writeIfNull(taskKey, []);
    return this;
  }

  T ready<T>(String key){
    //T stand for generic type if u store the list of type it return list
    // so this function is for ready data from localStorage
    return getStorage.read(key);
  }

  void write(String key, dynamic value) async {
    await getStorage.write(key, value);
  }
}