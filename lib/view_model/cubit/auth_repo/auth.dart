class Authentication {
  static final Map<String, String> authedUsers = {"omar":"2006"};

  static Future<void> addUser(String username, String password) async {
    authedUsers[username] = password;
  }
}
