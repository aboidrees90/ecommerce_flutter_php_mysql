class Connections {
  static const _baseURL = "http://172.16.60.66/api";
  static const _userURL = "$_baseURL/user";
  static const _productsURL = "$_baseURL/products";
  static const _uploadsURL = "$_baseURL/uploads";

  static get baseURL => _baseURL;
  static get userURL => _userURL;
  static get uploadsURL => _uploadsURL;

  // Auth  user
  static const signUp = "$_userURL/sign_up.php";
  static const signIn = "$_userURL/sign_in.php";

  // Products
  static const uploadImg = "$_productsURL/upload_img.php";
  static const productSave = "$_productsURL/save.php";

  static const trendingProducts = "$_productsURL/trending.php";
}
