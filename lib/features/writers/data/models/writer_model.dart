import '../../domain/entities/writer.dart';

class WriterModel extends Writer {
  WriterModel({
    super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.specialization,
    required super.hireDate,
    required super.status,
  });

  factory WriterModel.fromMap(Map<String, dynamic> map) {
    return WriterModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      specialization: map['specialization'],
      hireDate: DateTime.parse(map['hireDate']),
      status: map['status'],
    );
  }

  factory WriterModel.fromEntity(Writer writer) {
    return WriterModel(
      id: writer.id,
      name: writer.name,
      email: writer.email,
      phone: writer.phone,
      specialization: writer.specialization,
      hireDate: writer.hireDate,
      status: writer.status,
    );
  }
}
