import 'package:appp_sale_29092022/common/bases/base_event.dart';

class SignUpEvent extends BaseEvent {
  late String name, address, email, phone, password;

  SignUpEvent({
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props => [name, address, email, phone, password];

}