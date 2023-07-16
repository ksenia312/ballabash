import 'package:ballabash/app/data/firebase/firebase_service.dart';
import 'package:ballabash/app/data/firebase/firebase_game_repository.dart';
import 'package:ballabash/app/data/local/user_repository.dart';
import 'package:ballabash/app/domain/game_repository.dart';
import 'package:ballabash/features/game/domain/game_service.dart';
import 'package:ballabash/app/domain/app_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  await SharedPreferences.getInstance().then((value) {
    sl.registerSingleton<SharedPreferences>(value);
  });
  sl.registerSingleton<UserRepository>(
    UserRepository(
      sl.get<SharedPreferences>(),
    ),
  );
  sl.registerFactory<GameRepository>(
    () => FirebaseGameRepository(FirebaseService()),
  );
  sl.registerSingleton<AppService>(
    AppService(sl.get<GameRepository>(), sl.get<UserRepository>()),
  );
  sl.registerFactory<GameService>(
    () => GameService(sl.get<GameRepository>(), sl.get<UserRepository>()),
  );
}

T getIt<T extends Object>({
  String? instanceName,
  Object? param1,
  Object? param2,
}) {
  return sl.get<T>(
    instanceName: instanceName,
    param1: param1,
    param2: param2,
  );
}
