import 'package:bloc/bloc.dart';
import 'package:delesapp/bloc/register_bloc/register_event.dart';
import 'package:delesapp/bloc/register_bloc/register_state.dart';
import 'package:delesapp/data/models/register_result_model.dart';
import 'package:delesapp/data/repositories/register_repository.dart';
import 'package:meta/meta.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterRepository repository;

  RegisterBloc({@required this.repository});

  @override
  RegisterState get initialState => RegisterInitialState();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is CreateAccountEvent) {
      yield CreatingAccountState();
      try {
        Map<String, String> data = {
          'name': event.name,
          'email': event.email,
          'phone_number': event.phoneNumber,
          'password': event.password,
          'confirm_password': event.confirmPassword,
        };

        RegisterResult registerResult = await repository.createAccount(data);

        if (registerResult.success) {
          yield AccountCreatedState();
        } else {
          yield CreateAccountFailedState();
        }
      } catch (e) {
        yield RegisterErrorState(message: e.toString());
      }
    }
  }
}
