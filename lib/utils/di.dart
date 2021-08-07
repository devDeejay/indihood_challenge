import 'package:dhananjay_indihood_submission/services/networking_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:dhananjay_indihood_submission/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupDI() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => NetworkingRepo());
}
