# Flutter Notes App with Firebase

A complete Flutter notes application with Firebase Authentication and Cloud Firestore integration using Provider for state management.

## Features

- **Separate Authentication Screens**: Dedicated Sign In and Sign Up screens
- **Firebase Authentication**: Email/Password signup and login with comprehensive validation
- **Real-time CRUD Operations**: Create, Read, Update, Delete notes with instant UI updates
- **Provider State Management**: Clean architecture eliminating all setState() calls
- **Real-time Firestore Sync**: Live data synchronization with Firestore database
- **Input Validation**: Comprehensive form validation with specific error messages
- **User Feedback**: Color-coded SnackBar notifications (green success, red error)
- **Clean UI**: Material Design 3 with responsive layouts and polished Cards
- **Session Persistence**: User stays logged in across app restarts
- **Error Handling**: Comprehensive error handling for all operations

## Architecture

This project follows clean architecture principles with complete separation of concerns:

<img width="266" alt="image" src="https://github.com/user-attachments/assets/11aa3cdf-3c47-4a2f-91f3-f625b63028bc" />


##  Firebase Integration

### Setup Requirements
1. **Firebase Project**: Created at [Firebase Console](https://console.firebase.google.com/)
2. **Authentication**: Email/Password provider enabled
3. **Firestore Database**: Created with proper security rules
4. **Firestore Indexes**:  Required for real-time queries
5. **Platform Configuration**:
   - `android/app/google-services.json` (Android)
   - `firebase_options.dart` (Generated via FlutterFire CLI)

## Getting Started

### Prerequisites
- Flutter SDK (latest stable)
- Firebase CLI
- FlutterFire CLI

### Installation Steps
1. **Clone the repository**
   ```bash
   git clone [your-repo-url]
   cd flutter-notes-app-firebase
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Configuration**
   ```bash
   npm install -g firebase-tools
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

4. **Firestore Indexes Setup** **CRITICAL STEP**
   
   ```bash
   firebase login
   firebase init firestore
   ```
   
  
5. **Run the application**
   ```bash
   flutter run
   ```
   

### CRUD Operations
- **Create**: `await addNote(text, userId)` - Instant UI update via stream
- **Read**: `startListeningToNotes(userId)` - Real-time streaming
- **Update**: `await updateNote(noteId, text)` - Immediate reflection
- **Delete**: `await deleteNote(noteId)` - Real-time removal


### Dart Analyzer Results
![Screenshot 2025-07-06 223156](https://github.com/user-attachments/assets/053830e8-646b-42dc-8c10-1e859cfba50d)


## Security Implementation

- **User Data Isolation**: Notes secured by userId
- **Authentication Required**: All operations require valid auth
- **Firestore Rules**: Server-side security enforcement
- **Input Validation**: Client-side data sanitization
- **Error Information**: Sensitive details not exposed to users

## License

Educational project - ALU Individual Assignment 2
