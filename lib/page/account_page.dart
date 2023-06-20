import 'package:flutter/material.dart';
import 'package:supabase_quickstart/main.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _usernameController = TextEditingController();
  final _websiteController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  Future<void> _getInitialProfile() async {
    final userId = supabase.auth.currentUser!.id;
    final data =
        await supabase.from('profiles').select().eq('id', userId).single();
    setState(() {
      _usernameController.text = data['username'];
      _websiteController.text = data['website'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: _usernameController,
            decoration:
                const InputDecoration(label: Text("Enter your Username")),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _websiteController,
            decoration:
                const InputDecoration(label: Text("Enter your Website")),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () async {
                final username = _usernameController.text.trim();
                final website = _websiteController.text.trim();
                final userId = supabase.auth.currentUser!.id;

                await supabase.from("profiles").update({
                  'username': username,
                  'website': website,
                }).eq('id', userId);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Your data has been saved!")));
                }
              },
              child: Text("Update Profile"))
        ],
      ),
    );
  }
}
