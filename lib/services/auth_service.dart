import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class AuthService extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _currentUser != null;

  // Simulación de login
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simular delay de API
    await Future.delayed(Duration(seconds: 2));

    // Credenciales demo
    if (email == 'admin@test.com' && password == '123456') {
      _currentUser = User(
        id: '1',
        email: email,
        name: 'Administrador',
      );
      
      // Guardar sesión
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', email);
      
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('userEmail');
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final userEmail = prefs.getString('userEmail');

    if (isLoggedIn && userEmail != null) {
      _currentUser = User(
        id: '1',
        email: userEmail,
        name: 'Administrador',
      );
      notifyListeners();
    }
  }
}