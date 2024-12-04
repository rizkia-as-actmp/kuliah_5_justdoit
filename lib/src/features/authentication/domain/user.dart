class User {
  const User({
    required this.password,
    required this.passwordConfirm,
    required this.email,
    required this.emailVisibility,
    required this.verified,
    required this.name,
  });

  final String password;
  final String passwordConfirm;
  final String email;
  final String emailVisibility;
  final bool verified;
  final String name;

  // NOTE:  JSON response may contain many different fields, we only need to parse the ones that will be used in the UI.
}
