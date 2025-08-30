import '../../domain/entities/writer.dart';
import '../../domain/repositories/writer_repository.dart';
import '../models/writer_model.dart';
import 'writer_database_service.dart';

class WriterRepositoryImpl implements WriterRepository {
  final WriterDatabaseService _databaseService = WriterDatabaseService();

  @override
  Future<List<Writer>> getAllWriters() async {
    final writers = await _databaseService.getAllWriters();
    return writers;
  }

  @override
  Future<Writer?> getWriterById(int id) async {
    return await _databaseService.getWriterById(id);
  }

  @override
  Future<int> insertWriter(Writer writer) async {
    final writerModel = WriterModel.fromEntity(writer);
    return await _databaseService.insertWriter(writerModel);
  }

  @override
  Future<int> updateWriter(Writer writer) async {
    final writerModel = WriterModel.fromEntity(writer);
    return await _databaseService.updateWriter(writerModel);
  }

  @override
  Future<int> deleteWriter(int id) async {
    return await _databaseService.deleteWriter(id);
  }
}
