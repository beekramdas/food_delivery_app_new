import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  const AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Stream<User?> get user => firebaseAuth.authStateChanges();

  Future<UserModel> signUp(
      {required String name, required String email, required password}) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = credential.user!;
    final userModel = UserModel(id: user.uid, name: name, email: email);
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    return userModel;
  }

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    final doc = await firebaseFirestore
        .collection("users")
        .doc(credential.user!.uid)
        .get();
    return UserModel.fromMap(doc.data()!);
  }

  // ========================
  // ⭐ Google Sign In (v7.2.0)
  // ========================
  Future<UserModel> signInWithGoogle() async {
    try {
      // 1️⃣ Initialize Google Sign In
      await GoogleSignIn.instance.initialize(
        serverClientId: null, // Only needed for web/server auth
      );

      // 2️⃣ Start Sign In
      final GoogleSignInAccount googleUser =
          await GoogleSignIn.instance.authenticate();

      // 3️⃣ Get tokens
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // 4️⃣ Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // 5️⃣ Sign in Firebase
      final userCredential =
          await firebaseAuth.signInWithCredential(credential);

      final firebaseUser = userCredential.user!;

      // 6️⃣ Save to Firestore if new
      final userDoc =
          firebaseFirestore.collection("users").doc(firebaseUser.uid);

      final snapshot = await userDoc.get();

      if (!snapshot.exists) {
        final newUser = UserModel(
          id: firebaseUser.uid,
          name: firebaseUser.displayName ?? "",
          email: firebaseUser.email ?? "",
        );

        await userDoc.set(newUser.toMap());
        return newUser;
      }

      return UserModel.fromMap(snapshot.data()!);
    } catch (e) {
      throw Exception("Google Sign In Failed: $e");
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await GoogleSignIn.instance.signOut();
  }
}
