// File: phonebook_page.dart
import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'phonebook_model.dart';

class PhoneBookPage extends StatefulWidget {
  @override
  _PhoneBookPageState createState() => _PhoneBookPageState();
}

class _PhoneBookPageState extends State<PhoneBookPage> {
  late DatabaseHelper _databaseHelper;
  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper(); // Inisialisasi DatabaseHelper
    _loadContacts();
  }

  // Memuat daftar kontak dari database
  void _loadContacts() async {
    List<Contact> contacts = await _databaseHelper.getContacts();
    print("Loaded contacts: $contacts"); // Menambahkan log untuk debugging
    setState(() {
      _contacts = contacts;
    });
  }


  // Menambahkan kontak ke dalam database
  void _addContact(String name, String phone) async {
    if (name.isNotEmpty && phone.isNotEmpty) {
      Contact contact = Contact(name: name, phone: phone);
      await _databaseHelper.insertContact(contact); // Tunggu sampai insert selesai
      _loadContacts(); // Muat kontak setelah menambahkannya
    }
  }


  // Menghapus kontak dari database
  void _deleteContact(int id) {
    _databaseHelper.deleteContact(id);
    _loadContacts();  // Memuat ulang kontak setelah penghapusan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhoneBook'),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_contacts[index].name),
            subtitle: Text(_contacts[index].phone),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteContact(_contacts[index].id!);  // Menghapus kontak berdasarkan id
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);  // Menampilkan dialog untuk menambah kontak
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Menampilkan dialog untuk menambah kontak baru
  void _showAddContactDialog(BuildContext context) {
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                String name = _nameController.text;
                String phone = _phoneController.text;
                if (name.isNotEmpty && phone.isNotEmpty) {
                  _addContact(name, phone);  // Menambahkan kontak jika valid
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Menutup dialog tanpa menambah kontak
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
