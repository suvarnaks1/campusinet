// import 'package:campusconnection/RoleSelectionScreen.dart';
// import 'package:campusconnection/students/CustomAnimatedBottomBar.dart';
// import 'package:campusconnection/students/student_home.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const CampusConnectApp());
// }

// class CampusConnectApp extends StatelessWidget {
//   const CampusConnectApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Campus Connect',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.black, // ബ്ലാക്ക് ബാക്ക്ഗ്രൗണ്ട്
//         primaryColor: const Color(0xFF1B2A4E), // ഡാർക്ക് ബ്ലൂ
//         fontFamily: 'Roboto',
//       ),
//       home:CustomAnimatedBottomBar(
//         selectedIndex: 0,
//         onItemSelected: (index) {},
//       ),
//     );
//   }
// }
import 'package:campusconnection/common/home.dart';
import 'package:flutter/material.dart';
// നിങ്ങളുടെ പ്രൊജക്റ്റിലെ StudentHomeScreen ഇംപോർട്ട് ചെയ്യുക
import 'package:campusconnection/students/student_home.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // കോളേജ് വെബ്സൈറ്റിൽ നിന്ന് എടുത്ത നിറങ്ങൾ
  static const Color primaryNavy = Color(0xFF0F2547); // കടും നീല
  static const Color accentGold = Color(0xFFEAB308);  // മഞ്ഞ/സ്വർണ്ണ നിറം

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Connect Nav',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CampusNavScreen(),
    );
  }
}

class CampusNavScreen extends StatefulWidget {
  const CampusNavScreen({super.key});

  @override
  State<CampusNavScreen> createState() => _CampusNavScreenState();
}

class _CampusNavScreenState extends State<CampusNavScreen> {
  int _currentIndex = 0;

  // 5 പേജുകൾ (Home, About, Campus Portal, Contact, Profile)
  final List<Widget> _pages = [
    HomeScreen(),
    // <--- Home ക്ലിക്ക് ചെയ്യുമ്പോൾ ഇതിലേക്ക് പോകും
    const Center(child: Text('About Us Page', style: TextStyle(fontSize: 24, color: Colors.black))),
     const StudentHomeScreen(), // നടുവിലെ ബട്ടൺ
    const Center(child: Text('Contact Page', style: TextStyle(fontSize: 24, color: Colors.black))),
    const Center(child: Text('Profile Page', style: TextStyle(fontSize: 24, color: Colors.black))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6), // ലൈറ്റ് ഗ്രേ ബാക്ക്ഗ്രൗണ്ട് (സ്റ്റുഡന്റ് ഹോം നന്നായി കാണാൻ)
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 10),
          child: SizedBox(
            height: 85, 
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // 1. നീല ബാക്ക്ഗ്രൗണ്ടും മഞ്ഞ ബോർഡറും ഉള്ള കർവ് (CustomPainter)
                Positioned.fill(
                  bottom: 0,
                  child: CustomPaint(
                    painter: CampusNavBarPainter(),
                  ),
                ),

                // 2. ഐക്കണുകളും ടെക്സ്റ്റുകളും (അനിമേഷനോടു കൂടി)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildNavItem(0, Icons.home_outlined, 'Home'),
                      _buildNavItem(1, Icons.info_outline, 'About Us'),
                      const SizedBox(width: 70), // നടുവിലെ ബട്ടണിന് വേണ്ടി സ്പേസ്
                      _buildNavItem(3, Icons.phone_outlined, 'Contact'),
                      _buildNavItem(4, Icons.person_outline, 'Profile'),
                    ],
                  ),
                ),

                // 3. നടുവിലെ മഞ്ഞ/സ്വർണ്ണ നിറത്തിലുള്ള സർക്കിൾ ബട്ടൺ (Campus Portal)
                Positioned(
                  top: -25,
                  child: GestureDetector(
                    onTap: () => setState(() => _currentIndex = 2), // Campus Portal പേജിലേക്ക്
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutBack,
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        color: MyApp.accentGold, // മഞ്ഞ നിറം
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: MyApp.accentGold.withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.school_outlined, // കോളേജ് പോർട്ടൽ ഐക്കൺ
                        size: 32,
                        color: MyApp.primaryNavy, // ഐക്കണിന് കടും നീല നിറം
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // അനിമേഷൻ ഉള്ള ഐക്കണുകൾ നിർമ്മിക്കാനുള്ള ഫങ്ക്ഷൻ
  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ഐക്കൺ അനിമേഷൻ
            AnimatedScale(
              scale: isSelected ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              child: Icon(
                icon,
                // സെലക്ട് ചെയ്യുമ്പോൾ മഞ്ഞ നിറം, അല്ലാത്തപ്പോൾ വെള്ള/ഗ്രേ
                color: isSelected ? MyApp.accentGold : Colors.grey[400],
                size: 26,
              ),
            ),
            const SizedBox(height: 6),
            // ടെക്സ്റ്റ് അനിമേഷൻ
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                color: isSelected ? MyApp.accentGold : Colors.grey[400],
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- വെബ്സൈറ്റ് തീമിലുള്ള നടുവിൽ കുഴിവ് (Notch) വരയ്ക്കാനുള്ള CustomPainter ----------
class CampusNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // ബാറിന്റെ ബാക്ക്ഗ്രൗണ്ട് കളർ (സൈറ്റിലെ ഡാർക്ക് നീല)
    final paint = Paint()
      ..color = const Color(0xFF142A4D) // അൽപ്പം ലൈറ്റ് ആയ നീല
      ..style = PaintingStyle.fill;

    final path = Path();
    final double width = size.width;
    final double height = size.height;
    final double notchRadius = 35.0;
    final double center = width / 2;

    path.moveTo(0, 0);
    path.lineTo(center - notchRadius - 20, 0);
    
    // സ്മൂത്ത് ആയ കർവ്
    path.quadraticBezierTo(
      center - notchRadius, 0, 
      center - notchRadius + 10, notchRadius * 0.8
    );
    path.quadraticBezierTo(
      center, notchRadius * 1.6, 
      center + notchRadius - 10, notchRadius * 0.8
    );
    path.quadraticBezierTo(
      center + notchRadius, 0, 
      center + notchRadius + 20, 0
    );

    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    // നിഴൽ ഇഫക്ട്
    canvas.drawShadow(path, Colors.black54, 10.0, true);
    canvas.drawPath(path, paint);
    
    // മുകളിൽ ഒരു മഞ്ഞ ബോർഡർ നൽകാൻ
    final borderPaint = Paint()
      ..color = const Color(0xFFEAB308).withOpacity(0.3) // മഞ്ഞ ബോർഡർ
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}