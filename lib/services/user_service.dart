class UserSingleton { 
  UserSingleton._privateConstructor();

  static UserSingleton _userInstance = UserSingleton._privateConstructor();

  factory UserSingleton() {
    return _userInstance;
  }

  void setUserInfo(UserSingleton userInfo) {
    _userInstance = userInfo;
  }

}