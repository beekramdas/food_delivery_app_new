import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/models/user.dart';

import '../../repositories/authRepository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  StreamSubscription? _authSubscription;

  AuthCubit({required this.authRepository}) : super(AuthState.initial()) {
    _authSubscription = authRepository.user.listen((firebaseUser) {
      if (firebaseUser != null) {
        emit(state.copyWith(authStatus: AuthStatus.authenticated));
      } else {
        emit(
            state.copyWith(authStatus: AuthStatus.unauthenticated, user: null));
      }
    });
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        errorMessage: null,
      ));
      final user = await authRepository.signUp(
          name: name, email: email, password: password);
      emit(state.copyWith(
          isLoading: false,
          errorMessage: null,
          user: user,
          authStatus: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> signIn({required email, required password}) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        errorMessage: null,
      ));
      final user =
          await authRepository.signIn(email: email, password: password);
      emit(state.copyWith(
        isLoading: false,
        authStatus: AuthStatus.authenticated,
        user: user,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> googleSignIn() async {
    try {
      emit(state.copyWith(
        isLoading: true,
        errorMessage: null,
      ));
      final user = await authRepository.signInWithGoogle();
      emit(state.copyWith(
        isLoading: false,
        errorMessage: null,
        authStatus: AuthStatus.authenticated,
        user: user,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    await authRepository.signOut();
    emit(state.copyWith(user: null, authStatus: AuthStatus.unauthenticated));
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
