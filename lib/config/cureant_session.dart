import 'package:exam2/screen/login/model_log.dart';
import 'package:exam2/screen/regeester/model_regester.dart';
class CurentSession{
  //singiltoan
  static final CurentSession _sheard=CurentSession._privet();
  factory CurentSession()=>_sheard;

CurentSession._privet();

UserModel?users;
ApiUser?myUser;
}

