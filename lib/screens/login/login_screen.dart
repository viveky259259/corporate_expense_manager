import 'package:corporate_expense_manager/bloc/login/login_bloc.dart';
import 'package:corporate_expense_manager/bloc/login/login_event.dart';
import 'package:corporate_expense_manager/bloc/login/login_state.dart';
import 'package:corporate_expense_manager/component/atoms/circular_progress_bar.dart';
import 'package:corporate_expense_manager/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userId;
  TextEditingController _password;
  FocusNode _userIdFocus;
  FocusNode _passwordFocus;
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _userId = TextEditingController();
    _password = TextEditingController();
    _userIdFocus = FocusNode();
    _passwordFocus = FocusNode();
    _scaffoldKey = GlobalKey();

    _userId.text = 'viveky259';
    _password.text = 'vivek@rirev.com';
    BlocProvider.of<LoginBloc>(context).listen((state) {
      if (state is LoggedIn) {
        Future.delayed(Duration(seconds: 2))
            .whenComplete(() => Get.off(DashboardScreen()));
      }
    });
  }

  void doLogin() {
    if (_userId.text.isEmpty || _password.text.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Please enter correct value'),
      ));
    } else
      BlocProvider.of<LoginBloc>(context)
          .add(LoginUser(_userId.text, _password.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Rirev Expenses'),
      ),
      body: BlocBuilder(
          bloc: BlocProvider.of<LoginBloc>(context),
          builder: (context, state) {
            Widget baseWidget = Column(
              children: [
                TextField(
                  controller: _userId,
                  focusNode: _userIdFocus,
                  decoration: InputDecoration(
                      hintText: 'eg. vivek123', labelText: 'User Id'),
                ),
                TextField(
                  controller: _password,
                  focusNode: _passwordFocus,
                  obscureText: true,
                  decoration:
                      InputDecoration(labelText: 'Password', hintText: '*****'),
                ),
                RaisedButton(
                  onPressed: doLogin,
                  child: Text('Login'),
                )
              ],
            );
            if (state is LogginIn) {
              return Stack(
                children: [CircularProgressBarAtom(), baseWidget],
              );
            }
            if (state is LoggedIn) {
              return Stack(
                children: [
                  Center(
                    child: Text('Welcome, ${state.user.firstName}'),
                  ),
                  baseWidget
                ],
              );
            }

            if (state is InitState) return baseWidget;
            return CircularProgressBarAtom();
          }),
    );
  }
}
