import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _isPasswordVisible = false;
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/main');
        break;
      case 1:
        Navigator.pushNamed(context, '/chat');
        break;
      case 2:
        Navigator.pushNamed(context, '/reviews');
        break;
      case 3:
        Navigator.pushNamed(context, '/to-do');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EDE5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'User Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              width: 450,
              height: 320,
              margin: EdgeInsets.symmetric(horizontal: 28.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    child: Text(
                      'A',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Alex Martin',
                    style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD700),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'User',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Level 2',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        hintText: 'Write your bio here...',
                        suffixIcon: Icon(Icons.edit, color: Colors.brown),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCard('Achievements', 'assets/images/achievement.jpg', '/achievement'),
                      _buildCard('My Report', 'assets/images/report.png', '/report'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildTextField('Username', 'mart_alex4'),
                  _buildTextField('Pronouns', 'he/him'),
                  _buildTextField('Gender', 'Male', isDropdown: true),
                  _buildTextField('Phone number', '+91 7977450101'),
                  _buildTextField('Password', '************', isPassword: true),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    'General Settings',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  _buildListItem(Icons.notifications, 'Notifications', trailing: Switch(value: true, onChanged: (value) {})),
                  _buildListItem(
                    Icons.language,
                    'Choose Language',
                    trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black),
                    onTap: () {
                      Navigator.pushNamed(context, '/lang');
                    },
                  ),
                  _buildListItem(
                    Icons.lock,
                    'Change Password',
                    onTap: () {
                      Navigator.pushNamed(context, '/changepass');
                    },
                  ),
                  Divider(),
                  Text(
                    'Information',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  _buildListItem(Icons.info, 'About App'),
                  _buildListItem(Icons.article, 'Terms & Conditions'),
                  _buildListItem(Icons.privacy_tip, 'Privacy Policy'),
                  _buildListItem(Icons.share, 'Share This App'),
                ],
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        backgroundColor: Color(0xFF9EBEF6),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 38, color: Colors.brown),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded, size: 38, color: Colors.brown),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create, size: 38, color: Colors.brown),
            label: 'Reviews',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule, size: 38, color: Colors.brown),
            label: 'Todo List',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String imagePath, String routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 150, height: 120),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, {bool isPassword = false, bool isDropdown = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          SizedBox(height: 5),
          isDropdown
              ? DropdownButtonFormField<String>(
            value: initialValue,
            onChanged: (String? newValue) {},
            items: <String>['Male', 'Female', 'Other']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          )
              : TextFormField(
            initialValue: initialValue,
            obscureText: isPassword ? !_isPasswordVisible : false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: isPassword
                  ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(IconData icon, String title, {Widget? trailing, GestureTapCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(title),
      trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black),
      onTap: onTap,
    );
  }
}
