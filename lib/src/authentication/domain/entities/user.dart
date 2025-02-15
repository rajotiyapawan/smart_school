import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String admissionNumber;
  final String className;
  final String? imgUrl;

  const User.empty():
      this(id: 1, name: '_empty.name',admissionNumber: '_empty.admissionNumber',className: '_empty.className',imgUrl: '_empty.imgUrl');

  const User({required this.id, required this.name, required this.admissionNumber, required this.className, this.imgUrl});

  @override
  List<Object?> get props => [id, name, admissionNumber, className, imgUrl];
}
