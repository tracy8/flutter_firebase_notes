// domain/repositories/note_repository.dart

import '../models/note_model.dart';

abstract class NoteRepository {
  Future<List<Note>> fetchNotes(String userId);
  Future<void> addNote(String userId, String text);
  Future<void> updateNote(String userId, String noteId, String text);
  Future<void> deleteNote(String userId, String noteId);
}
