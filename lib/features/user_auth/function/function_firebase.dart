import 'package:firebase_auth/firebase_auth.dart';

class FunctionFirebase {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final User? user = auth.currentUser;
}
