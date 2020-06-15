import 'package:bloc/bloc.dart';
import 'package:delesapp/bloc/login_bloc/login_event.dart';
import 'package:delesapp/bloc/login_bloc/login_state.dart';
import 'package:delesapp/data/models/login_result_model.dart';
import 'package:delesapp/data/repositories/login_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository;

  LoginBloc({@required this.repository});

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ValidateLoginEvent) {
      yield LoginValidatingState();
      try {
        Map<String, String> data = {
          'email': event.email,
          'password': event.password
        };

        LoginResult loginResult = await repository.loginValidation(data);
        if (loginResult.success) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString('token', loginResult.data.accessToken);
          yield LoginSucceedState();
        } else {
          yield LoginFailedState();
        }
      } catch (e) {
        yield LoginErrorState(message: e.toString());
      }
    }
  }
}
