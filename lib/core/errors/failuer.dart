abstract class Failuer {
  final String message;
  const Failuer(this.message);
}

class FirebaseAuthFailuer extends Failuer {
  const FirebaseAuthFailuer(super.message);
}

class FirebaseFirestoreFailuer extends Failuer {
  const FirebaseFirestoreFailuer(super.message);
}
