import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.signUp(email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(_parseFirebaseError(e)));
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.signIn(email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(_parseFirebaseError(e)));
    }
  }

  Future<void> signOut() async {
    await authRepository.signOut();
    emit(AuthInitial());
  }

  void checkAuthStatus() async {
    final loggedIn = await authRepository.isUserLoggedIn();
    emit(loggedIn ? AuthSuccess() : AuthInitial());
  }

  String _parseFirebaseError(dynamic error) {
    final errorMessage = error.toString();

    if (errorMessage.contains('email-already-in-use')) {
      return 'This email is already in use.';
    } else if (errorMessage.contains('invalid-email')) {
      return 'Invalid email format.';
    } else if (errorMessage.contains('user-not-found')) {
      return 'No user found for this email.';
    } else if (errorMessage.contains('wrong-password')) {
      return 'Incorrect password.';
    } else if (errorMessage.contains('weak-password')) {
      return 'Password should be at least 6 characters.';
    } else {
      return 'Something went wrong. Try again.';
    }
  }

  void reset() {
    emit(AuthInitial());
  }
}
