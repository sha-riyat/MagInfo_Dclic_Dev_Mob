import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/writer.dart';
import '../../data/repositories/writer_repository_impl.dart';
import '../widgets/writer_card.dart';
import '../widgets/add_writer_dialog.dart';

class WritersPage extends StatefulWidget {
  const WritersPage({super.key});

  @override
  State<WritersPage> createState() => _WritersPageState();
}

class _WritersPageState extends State<WritersPage> {
  final WriterRepositoryImpl _repository = WriterRepositoryImpl();
  List<Writer> _writers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWriters();
  }

  Future<void> _loadWriters() async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      final writers = await _repository.getAllWriters();
      setState(() {
        _writers = writers;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorSnackBar('Erreur lors du chargement des rédacteurs');
    }
  }

  Future<void> _addWriter() async {
    final result = await showDialog<Writer>(
      context: context,
      builder: (context) => const AddWriterDialog(),
    );

    if (result != null) {
      try {
        await _repository.insertWriter(result);
        _loadWriters();
        _showSuccessSnackBar('Rédacteur ajouté avec succès');
      } catch (e) {
        _showErrorSnackBar('Erreur lors de l\'ajout du rédacteur');
      }
    }
  }

  Future<void> _deleteWriter(Writer writer) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmer la suppression'),
        content: Text('Êtes-vous sûr de vouloir supprimer ${writer.name} ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );

    if (confirmed == true && writer.id != null) {
      try {
        await _repository.deleteWriter(writer.id!);
        _loadWriters();
        _showSuccessSnackBar('Rédacteur supprimé avec succès');
      } catch (e) {
        _showErrorSnackBar('Erreur lors de la suppression');
      }
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gestion des Rédacteurs',
          style: GoogleFonts.arya(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _writers.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_outline,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Aucun rédacteur trouvé',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ajoutez votre premier rédacteur',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _writers.length,
                  itemBuilder: (context, index) {
                    return WriterCard(
                      writer: _writers[index],
                      onDelete: () => _deleteWriter(_writers[index]),
                      onEdit: () => _editWriter(_writers[index]),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWriter,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Future<void> _editWriter(Writer writer) async {
    final result = await showDialog<Writer>(
      context: context,
      builder: (context) => AddWriterDialog(writer: writer),
    );

    if (result != null) {
      try {
        await _repository.updateWriter(result);
        _loadWriters();
        _showSuccessSnackBar('Rédacteur modifié avec succès');
      } catch (e) {
        _showErrorSnackBar('Erreur lors de la modification');
      }
    }
  }
}
