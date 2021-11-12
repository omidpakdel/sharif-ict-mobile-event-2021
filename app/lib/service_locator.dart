import 'package:app/core/data/base_service.dart';
import 'package:app/core/data/fake/base_fake_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupServices() {
  locator.registerLazySingleton<BaseService>(() => BaseFakeRepository());
}
