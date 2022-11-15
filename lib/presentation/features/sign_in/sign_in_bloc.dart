import 'dart:async';

import 'package:appp_sale_29092022/common/bases/base_bloc.dart';
import 'package:appp_sale_29092022/common/bases/base_event.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/app_resource.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/user_dto.dart';
import 'package:appp_sale_29092022/data/model/user.dart';
import 'package:appp_sale_29092022/data/repositories/authentication_repository.dart';
import 'package:appp_sale_29092022/presentation/features/sign_in/sign_in_event.dart';

class SignInBloc extends BaseBloc {
  late AuthenticationRepository _repository;
  StreamController<User> _userController = StreamController();

  Stream<User> get user => _userController.stream;

  void updateAuthenRepo(AuthenticationRepository authenticationRepository) {
    _repository = authenticationRepository;
  }

  @override
  void dispatch(BaseEvent event) {
    switch (event.runtimeType) {
      case SignInEvent:
        handleSignIn(event as SignInEvent);
        break;
    }
  }

  void handleSignIn(SignInEvent event) async {
    try {
      AppResource<UserDTO> resourceUserDTO =
          await _repository.signIn(event.email, event.password);
      if (resourceUserDTO.data == null) return;
      UserDTO userDTO = resourceUserDTO.data!;
      User user = User(userDTO.email, userDTO.name, userDTO.phone, userDTO.token);
      _userController.sink.add(user);
    } catch (e) {
      _userController.sink.addError(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _userController.close();
  }
}
