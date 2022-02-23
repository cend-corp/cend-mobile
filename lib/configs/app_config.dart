abstract class AppConfig{

  static const String uuidRegex = r'\b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b';

  static const String backendBaseUrl = 'http://10.3.4.66:3000';

  static const String authUrl = backendBaseUrl+'/auth';

  static const String signInUri = '/signIn';

  static const String signUpUri = '/signUp';
}