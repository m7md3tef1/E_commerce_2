abstract class AuthState
{

}
class initialState extends AuthState
{

}

//PhoneAuth
class PhoneAuthLoading extends AuthState
{

}
class PhoneAuthSuccess extends AuthState
{
  String Phone;
  PhoneAuthSuccess(this.Phone);
}
class PhoneAuthFailed extends AuthState
{

}

//otp
class OtpSuccess extends AuthState
{

}
class OtpFailed extends AuthState
{
final String error;
OtpFailed(this.error);
}
class OtpLoading extends AuthState
{

}