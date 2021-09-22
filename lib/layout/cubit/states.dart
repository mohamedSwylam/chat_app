abstract class ChatAppStates {}

class ChatAppInitialStates extends ChatAppStates {}

class ChatAppLoadingStates extends ChatAppStates {}

class ChatAppSuccessStates extends ChatAppStates {}

class ChatAppErrorStates extends ChatAppStates {
  final String error;

  ChatAppErrorStates(this.error);
}

class GetUserLoadingStates extends ChatAppStates {}

class GetUserSuccessStates extends ChatAppStates {}

class GetUserErrorStates extends ChatAppStates {
  final String error;

  GetUserErrorStates(this.error);
}
class GetAllUserLoadingStates extends ChatAppStates {}

class GetAllUserSuccessStates extends ChatAppStates {}

class GetAllUserErrorStates extends ChatAppStates {
  final String error;

  GetAllUserErrorStates(this.error);
}

class ChatAppTabBarChangeState extends ChatAppStates {}

class EditProfilePasswordVisibilityState extends ChatAppStates {}

class ChangeGenderState extends ChatAppStates {}

class ChangeRelationState extends ChatAppStates {}

class UpdateErrorState extends ChatAppStates {
  final String error;

  UpdateErrorState(this.error);
}

class UpdateLoadingState extends ChatAppStates {}

class UpdateSuccessState extends ChatAppStates {}

class UpdateEmailAndPasswordErrorState extends ChatAppStates {
  final String error;

  UpdateEmailAndPasswordErrorState(this.error);
}

class UpdateEmailAndPasswordLoadingState extends ChatAppStates {}

class UpdateEmailAndPasswordSuccessState extends ChatAppStates {}

class PickedProfileImageSuccessState extends ChatAppStates {}

class PickedProfileImageErrorState extends ChatAppStates {
}

class PickedCoverImageSuccessState extends ChatAppStates {}

class PickedCoverImageErrorState extends ChatAppStates {

}

class PickedPostImageSuccessState extends ChatAppStates {}

class PickedPostImageErrorState extends ChatAppStates {}

class UploadPickedProfileImageSuccessState extends ChatAppStates {}

class UploadPickedProfileImageErrorState extends ChatAppStates {
  final error;

  UploadPickedProfileImageErrorState(this.error);
}

class UploadPickedCoverImageSuccessState extends ChatAppStates {}

class UploadPickedCoverImageErrorState extends ChatAppStates {
  final error;

  UploadPickedCoverImageErrorState(this.error);
}

class CreatePostErrorState extends ChatAppStates {}

class CreatePostLoadingState extends ChatAppStates {}

class CreatePostSuccessState extends ChatAppStates {}

class RemovePostImageState extends ChatAppStates {}

class GetPostLoadingStates extends ChatAppStates {}

class GetPostSuccessStates extends ChatAppStates {}

class GetPostErrorStates extends ChatAppStates {
  final String error;

  GetPostErrorStates(this.error);
}

class LikePostSuccessStates extends ChatAppStates {}

class LikePostErrorStates extends ChatAppStates {
  final String error;

  LikePostErrorStates(this.error);
}
class CommentPostSuccessStates extends ChatAppStates {}

class CommentPostErrorStates extends ChatAppStates {
  final String error;

  CommentPostErrorStates(this.error);
}
