import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';
import '../../data/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authRepo.signIn(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authRepo.signUp(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void reset() => emit(AuthInitial());
}
