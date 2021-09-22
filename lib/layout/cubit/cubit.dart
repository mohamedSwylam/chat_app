import 'dart:io';
import 'package:chatapp/models/post_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:bloc/bloc.dart';
import 'package:chatapp/layout/cubit/states.dart';
import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/modules/calles_screen/calls_screen.dart';
import 'package:chatapp/modules/chats_screen/chats_screen.dart';
import 'package:chatapp/modules/feed_screen/feeds_screen.dart';
import 'package:chatapp/modules/notification/notification_sceen.dart';
import 'package:chatapp/modules/settings/settings_screen.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChatAppCubit extends Cubit<ChatAppStates> {
  ChatAppCubit() : super(ChatAppInitialStates());

  static ChatAppCubit get(context) => BlocProvider.of(context);
  List<Tab> tabBarItem = [
    Tab(
      icon: Icon(IconBroken.Home),
    ),
    Tab(
      icon: Icon(IconBroken.Chat),
    ),
    Tab(
      icon: Icon(
        IconBroken.Call,
      ),
    ),
    Tab(
      icon: Icon(IconBroken.Notification),
    ),
    Tab(
      icon: Icon(IconBroken.Setting),
    ),
  ];
  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    CallsScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  int currentTabIndex = 0;

  void changeTabBarItem(int index) {
    if (index == 1)
      getUsers();
    currentTabIndex = index;
    emit(ChatAppTabBarChangeState());
  }

  UserModel userModel;

  void getUserData() {
    emit(GetUserLoadingStates());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data());
      emit(GetUserSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserErrorStates(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(EditProfilePasswordVisibilityState());
  }

  String gender;
  int val = 1;

  void changeGender(value) {
    val = value;
    switch (val) {
      case 1:
        gender = 'Male';
        break;
      case 2:
        gender = 'Female';
        break;
    }
    print(gender);
    emit(ChangeGenderState());
  }

  File profileImage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      uploadProfileImage();
      emit(PickedProfileImageSuccessState());
    } else {
      print('No image selected.');
      emit(PickedProfileImageErrorState());
    }
  }

  File coverImage;
  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      uploadCoverImage();
      emit(PickedCoverImageSuccessState());
    } else {
      print('No image selected.');
      emit(PickedCoverImageErrorState());
    }
  }

  void uploadProfileImage() {
    emit(UpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(UploadPickedProfileImageSuccessState());
        print(value);
        updateUser(
          name: userModel.name,
          education: userModel.education,
          address: userModel.address,
          dateOfBirth: userModel.dateOfBirth,
          work: userModel.work,
          relationship: userModel.relationship,
          bio: userModel.bio,
          phone: userModel.phone,
          profileImage: value,
        );
      }).catchError((error) {
        emit(UploadPickedProfileImageErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(UploadPickedProfileImageErrorState(error.toString()));
    });
  }

  void uploadCoverImage() {
    emit(UpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(UploadPickedProfileImageSuccessState());
        print(value);
        updateUser(
          name: userModel.name,
          education: userModel.education,
          address: userModel.address,
          dateOfBirth: userModel.dateOfBirth,
          work: userModel.work,
          relationship: userModel.relationship,
          bio: userModel.bio,
          phone: userModel.phone,
          coverImage: value,
        );
      }).catchError((error) {
        emit(UploadPickedCoverImageErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(UploadPickedCoverImageErrorState(error.toString()));
    });
  }

  void updateUser({
    String name,
    String phone,
    String bio,
    String education,
    String address,
    String dateOfBirth,
    String work,
    String relationship,
    String profileImage,
    String coverImage,
  }) {
    UserModel model = UserModel(
      education: education,
      address: address,
      dateOfBirth: dateOfBirth,
      work: work,
      relationship: relationship,
      bio: bio,
      name: name,
      email: userModel.email,
      coverImage: coverImage ?? userModel.coverImage,
      profileImage: profileImage ?? userModel.profileImage,
      uId: userModel.uId,
      password: userModel.password,
      phone: phone,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UpdateErrorState(error.toString()));
    });
  }

  File postImage;

  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(PickedPostImageSuccessState());
    } else {
      print('No image selected.');
      emit(PickedPostImageErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(RemovePostImageState());
  }

  void uploadPostImage({
    @required String dateTime,
    @required String text,
  }) {
    emit(CreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(
          dateTime: dateTime,
          text: text,
          postImage: value,
        );
      }).catchError((error) {
        emit(CreatePostErrorState());
      });
    }).catchError((error) {
      emit(CreatePostErrorState());
    });
  }

  void createPost({
    @required String dateTime,
    @required String text,
    String postImage,
  }) {
    emit(CreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel.name,
      profileImage: userModel.profileImage,
      uId: userModel.uId,
      dateTime: dateTime,
      postImage: postImage ?? '',
      text: text,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(CreatePostSuccessState());
    }).catchError((error) {
      emit(CreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];

  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).catchError((error) {});
      });
      emit(GetPostSuccessStates());
    }).catchError((error) {
      emit(GetPostErrorStates(error.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel.uId)
        .set({
      'like': true,
    }).then((value) {
      emit(LikePostSuccessStates());
    }).catchError((error) {
      emit(LikePostErrorStates(error.toString()));
    });
  }
  void commentPost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(userModel.uId)
        .set({
      'comment': 'true',
    }).then((value) {
      emit(LikePostSuccessStates());
    }).catchError((error) {
      emit(LikePostErrorStates(error.toString()));
    });
  }
  List<UserModel> users = [];
  void getUsers() {
    if(users.length ==0)
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if(element.data()['uId'] != userModel.uId)
          users.add(UserModel.fromJson(element.data()));
      });
      emit(GetAllUserSuccessStates());
    }).catchError((error) {
      emit(GetAllUserErrorStates(error.toString()));
    });
  }
}
