class ApiUrlList {
  static String serverUrl = 'http://api.delesapp.tutorteknik.com';

  // Check if server is ready
  static String checkApiServer = serverUrl + '/api/check';

  // Auth
  static String validateLogin = serverUrl + '/api/auth/login';
  static String createAccount = serverUrl + '/api/auth/register';

  // Article
  static String getAllArticles = serverUrl + '/api/article';
}
