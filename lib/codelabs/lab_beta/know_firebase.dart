import 'package:codelab_training/presentation/core/state_core.dart';
import 'package:codelab_training/codelabs/lab_beta/src/authentication.dart';
import 'package:codelab_training/codelabs/lab_beta/src/guest_book.dart';
import 'package:codelab_training/codelabs/lab_beta/src/widgets.dart';
import 'package:codelab_training/codelabs/lab_beta/src/yes_or_not_selection.dart';
import 'package:codelab_training/presentation/core/router_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KnowFirebase extends StatefulWidget {
  const KnowFirebase({super.key});
  @override
  State<KnowFirebase> createState() => _KnowFirebaseState();
}

class _KnowFirebaseState extends State<KnowFirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Meetup'),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            routerCore.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100,
            // Aqui va una imagen - me interesa la logica.
            // Referente un meet-up the firebase
            color: Colors.amberAccent,
          ),
          const SizedBox(height: 8),
          const IconAndDetail(Icons.calendar_today, 'October 30'),
          const IconAndDetail(Icons.location_city, 'San Francisco'),
          Consumer<ApplicationState>(
              builder: (
            context,
            state,
            _,
          ) =>
                  AuthFunc(
                    loggedIn: state.loggedIn,
                    signOut: () {
                      FirebaseAuth.instance.signOut();
                    },
                  )),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header("What we'll be doing"),
          const Paragraph(
            'Join us for a day full of Firebase Workshops and Pizza!',
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                switch (appState.attendees) {
                  1 => const Paragraph('1 person going'),
                  >= 2 => Paragraph('${appState.attendees} people going'),
                  _ => const Paragraph('No one going'),
                },
                if (appState.loggedIn) ...[
                  YesOrNotSelection(
                    state: appState.attending,
                    onSelection: (attending) => appState.attending = attending,
                  ),
                  const Header('Discussion'),
                  GuestBook(
                    addMessage: (message) =>
                        appState.addMessageToGuestBook(message),
                    messages: appState.guestBookMessages,
                  ),
                  // Aqui falta algo.
                ]
              ],
            ),
          )
          // child: GuestBook(addMessage: (message) => print(message))),
        ],
      ),
    );
  }
}
