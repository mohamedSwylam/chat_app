abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  final String error;

  SignUpErrorState(this.error);
}

class CreateUserSuccessState extends SignUpStates {}

class CreateUserErrorState extends SignUpStates {
  final String error;

  CreateUserErrorState(this.error);
}

class SignUpPasswordVisibilityState extends SignUpStates {}




