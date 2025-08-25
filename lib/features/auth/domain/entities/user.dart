import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String displayName;
  final String timezone;

  const User({
    required this.id,
    required this.email,
    required this.displayName,
    required this.timezone,
  });

  @override
  List<Object?> get props => [id, email, displayName, timezone];
}
