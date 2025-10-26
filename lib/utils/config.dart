// O arquivo config.dart é responsável por centralizar as configurações do sistema, agrupando em um só lugar 
// URLs, chaves ou nomes de apps. Ao invés de você descrever essas informações a cada uso você simplesmente 
// faz uso da suas propriedades, tornando mais fácil a alteração. 
import 'dart:io';

class Config {
  static const String appName = "El@s conectadas";

  /// Retorna o endereço correto do backend dependendo da plataforma
  static String get apiURL {
    if (Platform.isAndroid) {
      // Emulador Android acessa o localhost do host via 10.0.2.2
      return "10.0.2.2:8080";
    } else if (Platform.isIOS) {
      // iOS Simulator acessa localhost normalmente
      return "localhost:8080";
    } else {
      // Dispositivo físico precisa do IP do computador na rede
      return "10.1.1.110:8080"; // Substitua pelo IP correto
    }
  }
  /// Endpoints da API
  static const String loginAPI = "/auth/login";
  static const String registerAPI = "/users/register";
  static const String userProfileAPI = "/users";
  static const String requestOTP = '/auth/request-otp';
  static const String verifyOTP = '/auth/verify-otp';
}