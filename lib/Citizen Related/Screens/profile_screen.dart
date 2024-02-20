import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('User Profile Page'),
          //leading: const MenuWidget(),
        ),
        body: const UserProfile(),
      );
}

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String _userName = 'Divu';
  String _userSurname = 'Kumbhani';
  final String _gender = 'female';
  final String _email = 'divu.kumbhani@example.com';
  final String _mobileNo = '+1234567890';
  final String _address = '123 Main Street, City';

  // Function to update user profile fields
  void _updateProfile() {
    // Implement your update logic here
    // For simplicity, we're just changing the user's name and reloading the UI
    setState(() {
      _userName = 'UpdatedName';
      _userSurname = 'UpdatedSurname';
      // Update other fields as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/img1.jpg"),
          ),
          const SizedBox(height: 16),
          Text(
            '$_userName $_userSurname',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Gender: $_gender',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Email: $_email',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Mobile No: $_mobileNo',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Address: $_address',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _updateProfile,
            child: const Text('Update Profile'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Implement logout logic here
              // For simplicity, navigate to the login screen
              Navigator.of(context).pop();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
