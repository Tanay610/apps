import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do_list_app/repository/auth_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class AppWriteProvider extends ChangeNotifier {
  Client client = Client();
  late Account _account;
  AuthStatus _status = AuthStatus.uninitialized;
  late Databases databases;

  late User _currentUser;

  AuthStatus get status => _status;

  User get currentUser => _currentUser;
  String? get username => _currentUser?.name;
  String? get email => _currentUser?.email;
  String? get userid => _currentUser?.$id;

  AppWriteProvider() {
    _init();
    loadUser();
  }

  _init() {
    client
        .setEndpoint("https://endpoint.sizifi.com/v1")
        .setProject("64562e66625f1fdc03f4")
        .setSelfSigned(status: true);

    _account = Account(client);
    Databases databases = Databases(client);
  }

  _login(String email, String password) {
    try {
      var result =
          _account!.createEmailSession(email: email, password: password);
      print(result);
    } catch (e) {
      print(e);
    }
  }

  Future createDocument(
      {required String databaseId,
      required String collectionId,
      required String documentId,
      required data}) async {
    try {
      final document = databases.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: documentId,
          data: data);
      return document;
    } finally {
      notifyListeners();
    }
  }

  loadUser() async {
    try {
      final user = await _account.get();
      _status = AuthStatus.authenticated;
      _currentUser = user;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<User> createUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final user = await _account.create(
          userId: ID.unique(), email: email, password: password, name: name);
      return user;
    } finally {
      notifyListeners();
    }
  }

  Future<Session> createEmailSession(
      {required String email, required String password}) async {
    try {
      final session =
          await _account.createEmailSession(email: email, password: password);
      _currentUser = await _account.get();
      _status = AuthStatus.authenticated;
      return session;
    } finally {
      notifyListeners();
    }
  }

  signInWithProvider({required String provider}) async {
    try {
      final session = await _account.createOAuth2Session(provider: provider);
      _currentUser = await _account.get();
      _status = AuthStatus.authenticated;
      return session;
    } finally {
      notifyListeners();
    }
  }

  Future<Preferences> getUserPreferences() async {
    return await _account.getPrefs();
  }

  updatePreferences({required String bio}) async {
    return _account.updatePrefs(prefs: {'bio': bio});
  }

  // Future<User> SignUp(Map map) {
  //   final response = _account!.create(
  //     userId: ID.unique(),
  //     email: map["email"],
  //     password: map["password"],
  //     name: map["name"],
  //   );
  //   return response;
  // }

  // Future<models.Session> logIn(Map map) async {
  //   final response = await _account!.createEmailSession(
  //     email: map["email"],
  //     password: map["password"],
  //   );
  //   return response;
  // }

  /// creating appwrite database
}
