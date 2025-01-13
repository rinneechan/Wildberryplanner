import 'package:planner/screens/splash_screen.dart';
import 'package:flutter/material.dart';

// Dummy MyAccount page
class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Center(
        child: Text('Welcome to My Account page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC8A2C8), // Background color D4C2B4
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profil Image
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 67.5, // Set radius to 67.5 for a diameter of 135
                backgroundImage: AssetImage('assets/talitha.jpg'), // Ganti dengan path gambar Anda
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    // Logika untuk mengganti foto profil
                  },
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // TextField for Username
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // TextField for Date of Birth
            TextField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // TextField for Target for This Year
            TextField(
              decoration: InputDecoration(
                labelText: 'Target for This Year',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // TextField for Bio
            TextField(
              maxLines: 3, // Allow multiple lines for bio
              decoration: InputDecoration(
                labelText: 'Bio',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // Button Name
            Center(
              child: SizedBox(
                width: double.infinity, // Makes the button take the full width
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to MyAccountPage when button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccountPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Color(0xFFE6A8D7), //
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Center text horizontally
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(color: Colors.black, fontSize: 16), // Text color black
                      ),
                      SizedBox(height: 5), // Spacer
                      Text(
                        'Amare Putri Adinda', // Replace with actual name
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // Button for Phone Number
            Center(
              child: SizedBox(
                width: double.infinity, // Makes the button take the full width
                child: ElevatedButton(
                  onPressed: () {
                    // Additional logic for Phone Button, if necessary
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Color(0xFFE6A8D7), //
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Center text horizontally
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(color: Colors.black, fontSize: 16), // Text color black
                      ),
                      SizedBox(height: 5), // Spacer
                      Text(
                        '+62 813 8452 3923', // Replace with actual phone number
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // Button for Email
            Center(
              child: SizedBox(
                width: double.infinity, // Makes the button take the full width
                child: ElevatedButton(
                  onPressed: () {
                    // Additional logic for Email Button, if necessary
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Color(0xFFE6A8D7), //
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Center text horizontally
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(color: Colors.black, fontSize: 16), // Text color black
                      ),
                      SizedBox(height: 5), // Spacer
                      Text(
                        'amare.putri01@gmail.com', // Replace with actual email
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // Button for Address
            Center(
              child: SizedBox(
                width: double.infinity, // Makes the button take the full width
                child: ElevatedButton(
                  onPressed: () {
                    // Additional logic for Address Button, if necessary
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Color(0xFFE6A8D7), //
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Center text horizontally
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(color: Colors.black, fontSize: 16), // Text color black
                      ),
                      SizedBox(height: 5), // Spacer
                      Text(
                        'Podomoro park, Bandung, Indonesia', // Replace with actual address
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // Account Deletion Button
            Center(
              child: SizedBox(
                width: double.infinity, // Makes the button take the full width
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to delete account
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Delete Account'),
                        content: Text('Are you sure you want to delete your account?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Navigate to SplashScreen when "Yes" is pressed
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => SplashScreen()),
                              );
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('No'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Color for delete button
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: Text('Delete Account'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
