/*

FIREBASE IS OUR BACKEND - You can swap the backend here..

 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:signuptemplate/features/auth/domain/entities/app_user.dart';
import 'package:signuptemplate/features/auth/domain/repositories/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  // access to firebase

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> deleteAccount() async {
    try {
      // get current user
      final user = firebaseAuth.currentUser;

      // Check if user has logged in
      if (user == null) throw Exception('No user logged in ...');

      await user.delete();

      // logout
      await logout();
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }

  @override
  Future<AppUser?> getCurrentUser() async{
    // get current user from firebase
    final firebaseUser = firebaseAuth.currentUser;
    // no logged in user
    if (firebaseUser == null) return null;

    // logged in user exists

    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!);
  }

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      // attempt sign up
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // create user
      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);

      return user;
    } catch (e) {
      throw Exception('Login Error: $e');
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      // attempt sign up

      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Create user

      AppUser user = AppUser(email: email, uid: userCredential.user!.uid);

      return user;
    } catch (e) {
      throw Exception('Registration Failed: $e');
    }
  }

  @override
  Future<String> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }
}
