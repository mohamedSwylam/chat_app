import 'package:bloc/bloc.dart';
import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/modules/sign_up_screen/cubit/states.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  void userSignUp({
    @required String name,
    @required String password,
    @required String phone,
    @required String email,
  }) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password,)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      createUser(
        name: name,
        uId: value.user.uid,
        phone: phone,
        email: email,
      );
    }).catchError((error) {
      emit(SignUpErrorState(error.toString()));
    });
  }

  void createUser({
    String name,
    String uId,
    String phone,
    String email,
    String bio,
    String education,
    String address,
    String dateOfBirth,
    String gender,
    String work,
    String relationship,
    String password,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: email,
      uId: uId,
      isEmailVerified: false,
      bio: 'write your bio...',
      education: 'education',
      address: 'address',
      dateOfBirth: 'dateOfBirth',
      relationship: 'relationship',
      work: 'work',
      password: password,
      gender: 'gender',
      profileImage: 'https://www.iconsdb.com/icons/preview/light-gray/user-2-xxl.png',
      coverImage: 'https://thumbs.dreamstime.com/z/light-grey-cover-texture-vintage-book-light-grey-cover-texture-background-old-vintage-book-114472108.jpg',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(SignUpPasswordVisibilityState());
  }
}
