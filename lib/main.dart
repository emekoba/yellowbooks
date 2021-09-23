import 'package:flutter/material.dart';
import 'package:yellowbooks/MainBloc.dart';
import 'package:yellowbooks/Welcome/Welcome.dart';
import 'package:yellowbooks/Widgets/Style/AppTheme.dart';
import 'package:provider/provider.dart';
import 'package:yellowbooks/YellowBooks.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MainBloc>.value(value: MainBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthenticationWrapper(),
          theme: AppTheme.light,
          darkTheme: AppTheme.light,
        ));
  }
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool userLoggedIn = true;

  @override
  void initState() {
    // FirebaseAuth.instance.authStateChanges().listen((User user) {
    //   if (user.uid != null) {
    //     setState(() => userLoggedIn = true);
    //   } else {
    //     setState(() => userLoggedIn = false);
    //   }
    // });

    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userLoggedIn ? YellowBooks() : Welcome();
  }
}
