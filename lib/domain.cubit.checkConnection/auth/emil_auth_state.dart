abstract class EmailAuthStates{}
class InitialState extends EmailAuthStates{}

class SignInLoading extends EmailAuthStates{}

class SignInSuccess extends EmailAuthStates{
  String? email;

  SignInSuccess(this.email);

}
class SignInFailed extends EmailAuthStates{
  String? error;

  SignInFailed(this.error);



}

class SignUpLoading extends EmailAuthStates{

}
class SignUpSuccess extends EmailAuthStates{

}
class SignUpFailed extends EmailAuthStates{

}
