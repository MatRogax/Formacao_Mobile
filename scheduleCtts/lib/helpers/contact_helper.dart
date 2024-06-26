import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String idColumn = 'idColumn';
final String nameColumn = 'nameColumn';
final String emailColumn = 'emailColumn';
final String phoneColumn = 'phoneColumn';
final String imgColumn = 'imgColumn';

class ContactHelper {

  static final ContactHelper _instance = ContactHelper.internal();
  factory ContactHelper() => _instance;
  ContactHelper.internal();

  late Database _db;

  get db {
    if (_db != null) {
      return _db;
    }
    _db = initDb();
  }


  initDb() async {

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contacts.db");
    
  }


}
//----------Table----------
// id   name    email   phone   img

class Contact {
  int? id;
  String name = '';
  String email = '';
  String phone = '';
  String img = '';

  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "contact : $name email : $email phone: $phone img: $img";
  }
}
