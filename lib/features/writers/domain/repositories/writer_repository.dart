import '../entities/writer.dart';

abstract class WriterRepository {
  Future<List<Writer>> getAllWriters();
  Future<Writer?> getWriterById(int id);
  Future<int> insertWriter(Writer writer);
  Future<int> updateWriter(Writer writer);
  Future<int> deleteWriter(int id);
}
