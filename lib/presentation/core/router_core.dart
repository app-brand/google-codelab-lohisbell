import 'package:codelab_training/codelabs/lab_alfa/firebase_auth_ui.dart';
import 'package:codelab_training/codelabs/lab_eight/reply_app.dart';
import 'package:codelab_training/codelabs/lab_five/lab_five.dart';
import 'package:codelab_training/codelabs/lab_four/lab_four.dart';
import 'package:codelab_training/codelabs/lab_beta/know_firebase.dart';
import 'package:codelab_training/presentation/core/state_core.dart';
import 'package:codelab_training/codelabs/lab_one/lab_one.dart';
import 'package:codelab_training/codelabs/lab_seven/lab_seven.dart';
import 'package:codelab_training/codelabs/lab_six/lab_six.dart';
import 'package:codelab_training/codelabs/lab_gama/lab_ten.dart';
import 'package:codelab_training/codelabs/lab_two/lab_two.dart';
import 'package:codelab_training/presentation/home_page.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final routerCore = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/labOne',
      builder: (context, state) => LabOne(),
    ),
    GoRoute(
      path: '/labTwo',
      builder: (context, state) => LabTwo(),
    ),
    GoRoute(
      path: '/WelcomelabTwo',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: '/labFour',
      builder: (context, state) => DocumentApp(),
    ),
    GoRoute(
      path: '/labFive',
      builder: (context, state) => LabFive(),
    ),
    GoRoute(
      path: '/labSix',
      builder: (context, state) => Menu(),
    ),
    GoRoute(
      path: '/labSeven',
      builder: (context, state) => FadeInDemo(),
    ),
    GoRoute(
      path: '/labEight',
      builder: (context, state) => ReplyApp(),
    ),
    GoRoute(
      path: '/labAlfa',
      builder: (context, state) => FirebaseAuthUi(),
    ),
    GoRoute(
      path: '/labBeta',
      builder: (context, state) {
        // Utilizando providar - ver como implementar con blocs!
        final isLoggedIn = context.watch<ApplicationState>().loggedIn;
        if (!isLoggedIn) {
          // Modificar para agregar el app bar - regreso
          // Bastante completo la pantalla de UI de firebase.
          return SignInScreen();
        }
        // Stateful widget
        return KnowFirebase();
      },
      routes: [
        // Ruta para iniciar sesión
        GoRoute(
          path: 'sign-in',
          builder: (context, state) => SignInScreen(),
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return ProfileScreen(
              providers: const [],
              actions: [
                SignedOutAction((context) {
                  context.pushReplacement('/');
                }),
              ],
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/labGama',
      builder: (context, state) => LabTen(),
    )
  ],
);
