class ApiUrlList {
  static String serverUrl = 'http://api.delesapp.tutorteknik.com';
  // static String serverUrl = 'http://10.0.2.2:8000';

  // Check if server is ready
  static String checkApiServer = serverUrl + '/api/check';

  // Auth
  static String validateLogin = serverUrl + '/api/auth/login';
  static String createAccount = serverUrl + '/api/auth/register';
  static String loggedInUser = serverUrl + '/api/auth/detail';

  // Article
  static String getAllArticles = serverUrl + '/api/article';

  // Menu
  static String getAllMenus = serverUrl + '/api/menu';

  // Order
  static String storeOrder = serverUrl + '/api/order/store';
  static String orderHistory = serverUrl + '/api/order/history';
}
