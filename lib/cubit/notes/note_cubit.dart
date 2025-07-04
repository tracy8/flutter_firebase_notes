import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/note_model.dart';
import '../../../domain/repositories/note_repository.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteRepository repository;
  final String userId;

  NoteCubit({required this.repository, required this.userId})
      : super(NoteInitial());

  Future<void> fetchNotes() async {
    emit(NoteLoading());
    try {
      final notes = await repository.fetchNotes(userId);
      emit(NoteLoaded(notes));
    } catch (e) {
      emit(NoteError('Failed to fetch notes.'));
    }
  }

  Future<void> addNote(String text) async {
    try {
      await repository.addNote(userId, text);
      await fetchNotes();
    } catch (e) {
      emit(NoteError('Failed to add note.'));
    }
  }

  Future<void> updateNote(String id, String text) async {
    try {
      await repository.updateNote(userId, id, text);
      await fetchNotes();
    } catch (e) {
      emit(NoteError('Failed to update note.'));
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await repository.deleteNote(userId, id);
      await fetchNotes();
    } catch (e) {
      emit(NoteError('Failed to delete note.'));
    }
  }
}
