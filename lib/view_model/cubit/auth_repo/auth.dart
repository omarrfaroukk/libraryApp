class Authentication {
  static final Map<String, String> authedUsers = {};

  static Future<void> addUser(String username, String password) async {
    authedUsers[username] = password;
  }
}
