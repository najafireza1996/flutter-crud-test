// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:mc_crud_test/common/static/db_const_name.dart';

class Customer extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? bankAccountNumber;
  const Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.bankAccountNumber,
  });
 

  Customer copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? phoneNumber,
    String? bankAccountNumber,
  }) {
    return Customer(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'bankAccountNumber': bankAccountNumber,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      dateOfBirth: map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      bankAccountNumber: map['bankAccountNumber'] != null ? map['bankAccountNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      dateOfBirth,
      phoneNumber,
      bankAccountNumber,
    ];
  }
}
