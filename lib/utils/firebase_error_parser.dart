class FirebaseErrorParser {
  static String parse(String error) {
    if (error.contains("network-request-failed")) {
      return "No internet connection. Please check your network.";
    }
    if (error.contains("user-not-found")) {
      return "Email is not registered.";
    }
    if (error.contains("wrong-password")) {
      return "Incorrect password.";
    }
    if (error.contains("email-already-in-use")) {
      return "This email is already registered.";
    }
    if (error.contains("weak-password")) {
      return "Password is too weak.";
    }
    if (error.contains("invalid-email")) {
      return "Email format is invalid.";
    }
    return "Something went wrong. Please try again.";
  }
}
