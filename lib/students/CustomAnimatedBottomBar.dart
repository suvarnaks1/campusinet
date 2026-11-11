import 'package:campusconnection/students/student_home.dart';
import 'package:flutter/material.dart';

// 1. Custom Floating Animated Bottom Bar
class CustomAnimatedBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  
  final Color primaryColor = const Color(0xFF0A192F); // Dark Navy Blue
  final Color accentColor = const Color(0xFFD4AF37);  // Golden Yellow

  const CustomAnimatedBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxBarWidth = 650.0;
    double barWidth = screenWidth > maxBarWidth ? maxBarWidth : screenWidth;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: barWidth,
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          height: 75,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              // Background Bar (Home, Courses, Placements, Contact)
              Container(
                height: 65,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: accentColor.withOpacity(0.5), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: _buildNavItem(context, 0, Icons.home, "Home")),
                    Expanded(child: _buildNavItem(context, 1, Icons.school, "Courses")),
                    const Spacer(flex: 2), // Space for center floating button
                    Expanded(child: _buildNavItem(context, 3, Icons.business, "Placements")),
                    Expanded(child: _buildNavItem(context, 4, Icons.contact_mail, "Contact")),
                  ],
                ),
              ),
              
              // Floating Center Button (Career Page - Index 2)
              Positioned(
                top: 0,
                child: GestureDetector(
                  onTap: () => onItemSelected(2), // 2-ാമത്തെ ഇൻഡക്സ് Career Page-ന്
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: accentColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      border: Border.all(color: primaryColor, width: 4),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.work_outline, // Career Icon
                        color: primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon, String label) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => onItemSelected(index),
      splashColor: accentColor.withOpacity(0.2),
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected ? accentColor.withOpacity(0.25) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isSelected ? accentColor : Colors.white70,
              size: 22,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? accentColor : Colors.white70,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// 2. Main Screen with Stack to hold Pages and Floating Bottom Bar
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // 5 വ്യത്യസ്ത പേജുകൾ (Home, Courses, Career, Placements, Contact)
  final List<Widget> _pages = [
    StudentHomeScreen(),
    Container(color: Colors.green.shade50, child: const Center(child: Text("Courses Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))),
    Container(color: Colors.amber.shade50, child: const Center(child: Text("Career Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))),
    Container(color: Colors.purple.shade50, child: const Center(child: Text("Placements Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))),
    Container(color: Colors.red.shade50, child: const Center(child: Text("Contact Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ഫുൾ സ്‌ക്രീൻ പേജ് ഡിസ്‌പ്ലേ ചെയ്യാൻ Positioned.fill ഉപയോഗിച്ചിരിക്കുന്നു
          Positioned.fill(
            child: _pages[_currentIndex],
          ),
          
          // താഴെ ഫ്ലോട്ട് ചെയ്ത് നിൽക്കുന്ന Custom Animated Bottom Bar
          CustomAnimatedBottomBar(
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index; // ഏത് ഐക്കണിൽ/സെന്റർ ബട്ടണിൽ അമർത്തിയാലും കറക്റ്റായ പേജ് മാറും
              });
            },
          ),
        ],
      ),
    );
  }
}