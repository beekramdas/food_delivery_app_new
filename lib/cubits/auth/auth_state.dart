part of 'auth_cubit.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final User? user;
  final AuthStatus authStatus;

  const AuthState({
    this.user,
    required this.authStatus,
  });

  factory AuthState.initial() {
    return const AuthState(authStatus: AuthStatus.unknown);
  }

  @override
  List<Object?> get props => [user, authStatus];

  @override
  String toString() {
    return 'AuthState{user: $user, authStatus: $authStatus}';
  }

  AuthState copyWith({
    User? user,
    AuthStatus? authStatus,
  }) {
    return AuthState(
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
    );
  }
}
