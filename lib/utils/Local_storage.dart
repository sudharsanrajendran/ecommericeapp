import 'package:get_storage/get_storage.dart';

class TlocalStorage{
  static final TlocalStorage _instance =TlocalStorage._internal();
  factory TlocalStorage(){
    return _instance;
  }
  TlocalStorage._internal();
  final _storage= GetStorage();
  Future<void>savedata<T>(String key,T value)async {
    await _storage.write(key, value);
  }

  T? readdata<T>(String key){
    return _storage.read<T>(key);
  }
  Future <void>removedata(String key)async{
    await _storage.remove(key);
  }
  Future<void>clearAll()async{
    await _storage.erase();
  }
}