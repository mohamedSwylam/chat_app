import 'package:chatapp/layout/cubit/cubit.dart';
import 'package:chatapp/layout/cubit/states.dart';
import 'package:chatapp/layout/home_screen.dart';
import 'package:chatapp/modules/Login_screen/login_screen.dart';
import 'package:chatapp/modules/sign_up_screen/cubit/cubit.dart';
import 'package:chatapp/modules/sign_up_screen/cubit/states.dart';
import 'package:chatapp/shared/components.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoScreen extends StatelessWidget {
  var addressController = TextEditingController();
  var educationController = TextEditingController();
  var workController = TextEditingController();
  var bioController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var passwordController = TextEditingController();
  var genderController = TextEditingController();
  var relationshipController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppStates>(
        listener: (context, state) {
          if(state is UpdateSuccessState){
            navigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 210,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                Container(
                                  height: 140,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSEMzT3A936ggzPgcxDyYvSNHscpAQusuehxlzbwQf4yiRv2vMbVgYg-5cxopsk',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        IconBroken.Camera,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    backgroundColor: kPrimaryColor,
                                    radius: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 64,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://upload.wikimedia.org/wikipedia/commons/c/c1/Lionel_Messi_20180626.jpg'),
                                  radius: 60,
                                ),
                              ),
                              CircleAvatar(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    IconBroken.Camera,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                backgroundColor: kPrimaryColor,
                                radius: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text('Gender', style: TextStyle(
                            fontFamily: 'Pacifico-Regular',
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        SizedBox(height: 10,),
                        ListTile(
                          title: Text("Male"),
                          leading: Radio(
                            value: 1,
                            groupValue: ChatAppCubit.get(context).val,
                            onChanged: (value) => ChatAppCubit.get(context).changeGender(value),
                            activeColor: kPrimaryColor,
                          ),
                        ),
                        ListTile(
                          title: Text("Female"),
                          leading: Radio(
                            value: 2,
                            groupValue: ChatAppCubit.get(context).val,
                            onChanged: (value) => ChatAppCubit.get(context).changeGender(value),
                            activeColor: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: defaultFormField(
                        controller: bioController,
                        prefix: Icons.info_outline,
                        labelText: 'Bio',
                        type: TextInputType.text,
                        labelColor: Colors.grey,
                        onTap: () {},
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your bio ...';
                          }
                          return null;
                        },
                        iconColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: defaultFormField(
                        controller: educationController,
                        prefix: Icons.school,
                        labelText: 'Education',
                        type: TextInputType.text,
                        labelColor: Colors.grey,
                        onTap: () {},
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your education ..';
                          }
                          return null;
                        },
                        iconColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: defaultFormField(
                        controller: workController,
                        prefix: Icons.work,
                        labelText: 'Work',
                        type: TextInputType.text,
                        labelColor: Colors.grey,
                        onTap: () {},
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your work ..';
                          }
                          return null;
                        },
                        iconColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: defaultFormField(
                        controller: addressController,
                        prefix: Icons.home,
                        labelText: 'address',
                        type: TextInputType.text,
                        labelColor: Colors.grey,
                        onTap: () {},
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your address ..';
                          }
                          return null;
                        },
                        iconColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: defaultFormField(
                        controller: relationshipController,
                        prefix: Icons.favorite,
                        labelText: 'RelationShip',
                        type: TextInputType.text,
                        labelColor: Colors.grey,
                        onTap: () {},
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your Relationship ..';
                          }
                          return null;
                        },
                        iconColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: defaultFormField(
                        controller: dateOfBirthController,
                        prefix: Icons.date_range,
                        labelText: 'Date of birth',
                        type: TextInputType.text,
                        labelColor: Colors.grey,
                        onTap: () {},
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your date of birth ..';
                          }
                          return null;
                        },
                        iconColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ConditionalBuilder(
                        condition: state is! SignUpLoadingState,
                        builder: (context) {
                          return defaultButton(
                              function: () {
                                if(formKey.currentState.validate()){
                                  ChatAppCubit.get(context).updateUser(
                                      education: educationController.text,
                                      dateOfBirth: dateOfBirthController.text,
                                      address: addressController.text,
                                      bio:  bioController.text,
                                        relationship: relationshipController.text,
                                      work: workController.text,
                                  );
                                }
                              },
                              text: 'Continue',
                              color: Colors.greenAccent);
                        },
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
