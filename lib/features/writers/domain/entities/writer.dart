class Writer {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final String specialization;
  final DateTime hireDate;
  final String status;

  Writer({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.specialization,
    required this.hireDate,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'specialization': specialization,
      'hireDate': hireDate.toIso8601String(),
      'status': status,
    };
  }

  factory Writer.fromMap(Map<String, dynamic> map) {
    return Writer(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      specialization: map['specialization'],
      hireDate: DateTime.parse(map['hireDate']),
      status: map['status'],
    );
  }

  Writer copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? specialization,
    DateTime? hireDate,
    String? status,
  }) {
    return Writer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      specialization: specialization ?? this.specialization,
      hireDate: hireDate ?? this.hireDate,
      status: status ?? this.status,
    );
  }
}
