import 'package:flutter/material.dart';

class CustomAnimatedBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final Color accentColor;

  const CustomAnimatedBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.accentColor = const Color(0xFF8E24AA), // Purple
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxBarWidth = 600.0;
    double barWidth = screenWidth > maxBarWidth ? maxBarWidth : screenWidth;

    return Align(
      alignment: Alignment.bottomCenter,
      // ഇവിടെയാണ് പ്രധാന മാറ്റം. Material വിജറ്റ് നൽകിയിരിക്കുന്നു.
      child: Material(
        color: Colors.transparent, // പുറകിലെ നിറം ട്രാൻസ്പരന്റ് ആക്കുന്നു
        child: Container(
          width: barWidth,
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          height: 75,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              // 1. The Background Bar
              Container(
                height: 65,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: _buildNavItem(context, 0, Icons.home, "Home")),
                    Expanded(child: _buildNavItem(context, 1, Icons.info_outline, "About")),
                    const Spacer(flex: 2), // Center button-ന് വേണ്ടിയുള്ള സ്പേസ്
                    Expanded(child: _buildNavItem(context, 2, Icons.contact_support, "Contact")),
                    Expanded(child: _buildNavItem(context, 3, Icons.dashboard, "Dashboard")),
                  ],
                ),
              ),
              
              // 2. The Floating Center Button
              Positioned(
                top: 0,
                child: GestureDetector(
                  onTap: () => onItemSelected(4),
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      border: Border.all(color: accentColor, width: 4),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person, 
                        color: accentColor,
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
      splashColor: Colors.white.withOpacity(0.2), // ക്ലിക്ക് ചെയ്യുമ്പോൾ വരുന്ന നിറം
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white70,
              size: 24,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}