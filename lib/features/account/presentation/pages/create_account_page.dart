part of '../libraries/create_account_library.dart';

/// Displays a form to create an account
@RoutePage()
class CreateAccountPage extends StatelessWidget {
  /// Displays a form to create an account
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Create Account'),
        ),
        body: SingleChildScrollView(
          padding: AppSeparators.pagePadding,
          child: const CreateAccountForm(),
        ),
      );
}
