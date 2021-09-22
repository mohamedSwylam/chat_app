import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
Widget defaultAppBar({
  @required BuildContext context,
  String title,
  List<Widget> actions,
})=> AppBar(
  leading: IconButton(
    icon: Icon(IconBroken.Arrow___Left_Square),
    onPressed: (){
    Navigator.pop(context);
  },),
    title: Text(title, style: TextStyle(
        fontFamily: 'Pacifico-Regular',
        letterSpacing: 3,
        fontSize: 17),
    ),
  actions: actions,
    );

Widget defaultFormField({
  Color cursorColor,
  @required TextInputType type,
  @required TextEditingController controller,
  String labelText,
  Color labelColor,
  IconData prefix,
  IconData suffix,
  bool isPassword = false,
  Color iconColor,
  double curoserHeight,
  Function validate,
  Function onChange,
  Function onSubmit,
  Function onTap,
  Function suffixPressed,
}) =>
    TextFormField(
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      obscureText: isPassword,
      validator: validate,
      cursorHeight: curoserHeight,
      cursorColor: cursorColor,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico-Regular'),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        prefixIcon: Icon(
          prefix,
          color: iconColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );

Widget defaultButton(
        {@required Function function,
        @required String text,
        @required Color color}) =>
    Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(text),
        height: 50,
        textColor: Colors.white,
      ),
    );

void showToast({@required String text, @required ToastStates state}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      timeInSecForIosWeb: 5,
    );
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.all(
       0.0,
      ),
      child: Container(
        width: double.infinity,
        height: 4.0,
        color: Colors.grey[300],
      ),
    );
