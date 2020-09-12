import 'package:corporate_expense_manager/models/user/user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDbService {
  static HiveDbService instance = HiveDbService._();

  HiveDbService._();

  Future<void> init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(UserAdapter());
  }
}
