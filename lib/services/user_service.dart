class UserSingleton { 
  UserSingleton._privateConstructor();

  static UserSingleton _userInstance = UserSingleton._privateConstructor();

  factory UserSingleton() {
    return _userInstance;
  }

  static void setUserInfo(UserSingleton userInfo) {
    _userInstance = userInfo;
  }

  static getUserInfo(){
    return _userInstance;
  }
}