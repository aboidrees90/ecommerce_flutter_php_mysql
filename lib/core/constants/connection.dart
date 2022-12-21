class Connections {
  static const _baseURL = "http://172.16.60.66/api";
  static const _userURL = "$_baseURL/user";
  static const _cartURL = "$_baseURL/cart";
  static const _filesURL = "$_baseURL/files";
  static const _uploadsURL = "$_baseURL/uploads";
  static const _productsURL = "$_baseURL/products";
  static const _favoritesURL = "$_baseURL/favorites";

  static get baseURL => _baseURL;
  static get userURL => _userURL;
  static get filesURL => _filesURL;
  static get uploadsURL => _uploadsURL;
  static get productsURL => _productsURL;
  static get favoritesURL => _favoritesURL;

  // Auth  user
  static const signUp = "$_userURL/sign_up.php";
  static const signIn = "$_userURL/sign_in.php";

  // Files
  static const fileUpload = "$_filesURL/upload.php";
  static const fileRemove = "$_filesURL/remove.php";

  // Products
  static const addNewProduct = "$_productsURL/add.php";
  static const searchProducts = "$_productsURL/search.php";
  static const listAllProducts = "$_productsURL/list_all.php";
  static const listTrendingProducts = "$_productsURL/trending.php";

  // cart
  static const addToCart = "$_cartURL/add.php";
  static const getCartList = "$_cartURL/get.php";
  static const removeFromCart = "$_cartURL/delete.php";
  static const updateCartItem = "$_cartURL/update.php";

  // favorite
  static const addToFavorite = "$_favoritesURL/add.php";
  static const getFavoriteList = "$_favoritesURL/get.php";
  static const removeFromFavorite = "$_favoritesURL/delete.php";
  static const validateFavorites = "$_favoritesURL/validate.php";
  // static const updateCartItem = "$_cartURL/update.php";
}
