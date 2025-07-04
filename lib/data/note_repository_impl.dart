// data/note_repository_impl.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/note_model.dart';
import '../../domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<Note>> fetchNotes(String userId) async {
    final snapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('notes')
        .get();

    return snapshot.docs
        .map((doc) => Note(
      id: doc.id,
      text: doc['text'] ?? '',
    ))
        .toList();
  }

  @override
  Future<void> addNote(String userId, String text) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('notes')
        .add({'text': text});
  }

  @override
  Future<void> updateNote(String userId, String noteId, String text) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('notes')
        .doc(noteId)
        .update({'text': text});
  }

  @override
  Future<void> deleteNote(String userId, String noteId) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('notes')
        .doc(noteId)
        .delete();
  }
}
