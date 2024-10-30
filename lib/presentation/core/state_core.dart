import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelab_training/codelabs/lab_nine/src/guest_book_message.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

enum Attending { yes, no, unknown }

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  StreamSubscription<QuerySnapshot>? _guestBookSubscription;
  List<GuestBookMessage> _guestBookMessages = [];
  List<GuestBookMessage> get guestBookMessages => _guestBookMessages;
  int _attendees = 0;
  int get attendees => _attendees;

  Attending _attending = Attending.unknown;
  StreamSubscription<DocumentSnapshot>? _attendingSubscription;
  Attending get attending => _attending;
  set attending(Attending attending) {
    final userDoc = FirebaseFirestore.instance
        .collection('attendees')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    if (attending == Attending.yes) {
      userDoc.set(<String, dynamic>{'attending': true});
    } else {
      userDoc.set(<String, dynamic>{'attending': false});
    }
  }

  Future<void> init() async {
    // Inicializador de firebase dentro de lab_nine.
    /* await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform); */
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);
    FirebaseFirestore.instance
        .collection('attendees')
        .where('attending', isEqualTo: true)
        .snapshots()
        .listen((snapshot) {
      _attendees = snapshot.docs.length;
      notifyListeners();
    });
    // Callback con provider.
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        // Guardar el nombre del usuario.
        // Solo actualizar si el displayName es null o no coincide
        /* if (user.displayName == null ||
            user.displayName != user.email!.split('@')[0]) {
          user.updateDisplayName(user.email!.split('@')[0]);
        } */
        // Lectura de la coleccion
        _guestBookSubscription = FirebaseFirestore.instance
            .collection('guestbook')
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
          _guestBookMessages = [];
          for (final document in snapshot.docs) {
            _guestBookMessages.add(
              GuestBookMessage(
                name: document.data()['name'] as String,
                message: document.data()['text'] as String,
              ),
            );
          }
          notifyListeners();
        });
      } else {
        _loggedIn = false;
        _guestBookMessages = [];
        _guestBookSubscription?.cancel();
      }
      notifyListeners();
    });
  }

  Future<DocumentReference> addMessageToGuestBook(String message) {
    if (!_loggedIn) {
      throw Exception('Must be logged in');
    }
    return FirebaseFirestore.instance
        .collection('guestbook')
        .add(<String, dynamic>{
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'origin': [
        <String, dynamic>{
          'latitud': 1.7777777,
          'longitud': -1.78746633,
        }
      ]
    });
  }
}
