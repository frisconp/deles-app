import 'package:bloc/bloc.dart';
import 'package:delesapp/bloc/profile_bloc/profile_event.dart';
import 'package:delesapp/bloc/profile_bloc/profile_state.dart';
import 'package:delesapp/data/models/user_model.dart';
import 'package:delesapp/data/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository repository;

  ProfileBloc({@required this.repository});

  @override
  ProfileState get initialState => ProfileInitialState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetUserProfileEvent) {
      yield ProfileLoadingState();
      try {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        String accessToken = sharedPreferences.getString('token');
        User userData = await repository.getLoggedInUser(accessToken);

        yield ProfileSucceedState(user: userData);
      } catch (e) {
        yield ProfileErrorState(message: e.toString());
      }
    }
  }
}
