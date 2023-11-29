import 'package:cloud_firestore/cloud_firestore.dart';

class Models {
  String uid;
  String phoneNumber;
  String email;
  String photoURL;

  String name;

  Models({
    required this.uid,
    required this.phoneNumber,
    required this.email,
    required this.photoURL,
    required this.name,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'email': email,
        'phoneNumber': phoneNumber,
        'photoURL': photoURL,
      };

  ///
  static Models fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return Models(
      photoURL: snapshot['photoURL'],
      name: snapshot['name'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      phoneNumber: snapshot['phoneNumber'],
    );
  }
}
