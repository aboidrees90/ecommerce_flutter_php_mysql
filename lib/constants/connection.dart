class API {
  static const _baseURL = "http://172.16.60.66/api";
  static const _userURL = "$_baseURL/user";

  static get baseURL => _baseURL;
  static get userURL => _userURL;

  // Sign up  user
  static const signUp = "$_userURL/sign_up.php";
  static const signIn = "$_userURL/sign_in.php";
}
