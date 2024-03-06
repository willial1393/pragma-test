import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pragma/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String environment) async {
  await getIt.init(environment: environment);
}
