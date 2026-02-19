part of 'auth_cubit.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final UserModel? user;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({
    required this.authStatus,
    this.user,
    required this.isLoading,
    this.errorMessage,
  });

  factory AuthState.initial() {
    return const AuthState(
        authStatus: AuthStatus.unknown,
        user: null,
        isLoading: false,
        errorMessage: null);
  }

  @override
  String toString() {
    return 'AuthState{authStatus: $authStatus, user: $user, isLoading: $isLoading, errorMessage: $errorMessage}';
  }

  @override
  List<Object?> get props => [authStatus, user, isLoading, errorMessage];

  AuthState copyWith({
    AuthStatus? authStatus,
    UserModel? user,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
