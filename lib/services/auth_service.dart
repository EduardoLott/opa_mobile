class AuthService{

  static late String _user_token;
  static late int _user_id;

  static void setUserId(int id){
    _user_id = id;
  }

  static int getUserId(){
    return _user_id;
  }

  static void setUserToken(String token){
    _user_token = token;
  }

  static String getUserToken(){
    return _user_token;
  }
}