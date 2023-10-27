# Auto Login:
## Table of contents:-
> * [What is auto login?](#What-is-auto-login)
> * [Steps to use auto-login](#Steps-to-use-auto-login)
> * [Example](#Example)

## What is auto-login:
#### Assume that a user has a login to the system using HTTP on SERVER, then, after the user exit the apps, and runs the apps, no need to login again until the user forcefully logout or wipe the data of application manually.<br>
#### when user first-time login then auto-login saves user_id/email and a login-flag in sharedpreference.<br>
***after successful login this will store user_id/email and login-flag in preference and it automatically checks the user is already login or not..***

## Steps to use auto-login:
### For implementing auto-login there are few steps as follows:

### Step 1
Add this to your package's pubspec.yaml file:
````
dependencies:
  shared_preferences: ^0.5.7+3
````
### Step 2
Add below Preferences class in your util folder or you can also use it to adding SharedPreference plugin from the add-plugin list.
````
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final login_status_key = "login_status_key";
  static final user_id = "user_id_key";

  static Future<bool> setLoginStatus(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(login_status_key, status);
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool(login_status_key);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }

  static Future<bool> saveUserId(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(user_id, userName);
  }

  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(user_id);
  }

  static Future<bool> clearPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(password_user_idkey);
    prefs.setBool(login_status_key, false);
    return true;
  }
}
````
### Step 3
Call above static functions from login-screen after successful login.
````
for example:
________
___________
_____

RaisedButton(
      onPressed: (){
        //add below lines after successful login.
        Preferences.saveUserId(USER_ID or EMAIL);
        Preferences.setLoginStatus(true);//add this line
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
              return HomeScreen();
            }));
      },
      child: Text('Login'),
    ),

____________
_______
__________
}

````
### Step 4
Let's say an application has two screens the first one is LoginScreen and the second one is HomeScreen.<br>
When users first time launch the application then the first LoginScreen will appear. <br>
After successful login it will redirect to HomeScreen.<br>
Add the following lines in main.dart.
````
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //get loginStatus.
  bool isLogin = await Preferences.isLoggedIn();
  return runApp(MyApp(isLogin));//pass login-flag
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  MyApp(this.isLogin);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TEST',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          accentColor: ColorConst.accentColor,
        ),
        home: isLogin ? HomeScreen() : LoginScreen(),//check user is already login or not.
    );
  }
}
````
### Step 5
The last step is used for clear Preferences when the user logout.<br>
Simply add the below line when the user taps the logout button.
````
________
___________
_____

RaisedButton(
      onPressed: (){
        Preferences.clearPreference();//add this line
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
              return LoginScreen();
            }));
      },
      child: Text('logout'),
    ),

____________
_______
__________
}
````

