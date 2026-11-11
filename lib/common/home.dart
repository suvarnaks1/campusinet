import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final Color primaryNavy = const Color(0xFF0F2547); 
  final Color accentGold = const Color(0xFFEAB308);

  late AnimationController _heroController;
  late AnimationController _statsController;
  late AnimationController _cardsController;

  @override
  void initState() {
    super.initState();

    _heroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _statsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _cardsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), 
    );

    _startAnimations();
  }

  void _startAnimations() async {
    _heroController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _statsController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _cardsController.forward();
  }

  @override
  void dispose() {
    _heroController.dispose();
    _statsController.dispose();
    _cardsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _heroController,
              child: SlideTransition(
                position: Tween<Offset>(begin: const Offset(0, -0.1), end: Offset.zero)
                    .animate(CurvedAnimation(parent: _heroController, curve: Curves.easeOut)),
                child: _buildHeroSection(),
              ),
            ),

            ScaleTransition(
              scale: CurvedAnimation(parent: _statsController, curve: Curves.easeOutBack),
              child: _buildStatsSection(),
            ),

            _buildWhyChooseSection(),
            
            const SizedBox(height: 120), 
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return SizedBox(
      height: 440,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/campus.jpeg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: primaryNavy),
            ),
          ),
          Positioned.fill(
            child: Container(color: primaryNavy.withOpacity(0.75)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: accentGold, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "CENTER OF EXCELLENCE IN TECHNICAL EDUCATION",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: accentGold, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Welcome to St. Mary's\nPolytechnic College",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, height: 1.2),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Managed by the Catholic Diocese of Palakkad. Empowering students with industry-standard practical engineering skills, strong moral values, and premier technical diploma education.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentGold,
                      foregroundColor: primaryNavy,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: const Text("Admissions Open 2026-2027", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: primaryNavy,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: const Text("Explore Diploma Programs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      color: primaryNavy,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem("25+", "YEARS OF\nTECHNICAL LEGACY"),
          _buildDivider(),
          _buildStatItem("6", "CORE DIPLOMA\nSTREAMS"),
          _buildDivider(),
          _buildStatItem("100%", "PLACEMENT &\nTRAINING"),
          _buildDivider(),
          _buildStatItem("AICTE", "APPROVED &\nAFFILIATED"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: TextStyle(color: accentGold, fontSize: 22, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.bold, letterSpacing: 0.5, height: 1.2),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 35, width: 1, color: Colors.white24);
  }

  Widget _buildWhyChooseSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          const Text(
            "Why Choose St. Mary's\nPolytechnic College?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF0F2547), fontSize: 20, fontWeight: FontWeight.w900, height: 1.2),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "We cultivate a dedicated learning environment focused on practical engineering, industrial training, and holistic student development.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.5),
            ),
          ),
          const SizedBox(height: 30),
          
          // Overflow പരിഹരിക്കാൻ കാർഡിന്റെ ഉയരം 250 ആക്കി മാറ്റി
          SizedBox(
            height: 250, 
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildAnimatedCard(0, Icons.school, "Expert Technical\nFaculty", "Learn directly from experienced engineers and dedicated mentors focused on laboratory hands-on training"),
                _buildAnimatedCard(1, Icons.engineering, "Modern Workshops\n& Labs", "State-of-the-art facilities including Fitter Lab, Motor Vehicle (MMV) Lab, Electrical Machines Lab, and advanced"),
                _buildAnimatedCard(2, Icons.work, "Campus Placements", "Strong industry tie-ups including regular campus recruitment drives with leading manufacturers like Ashok Leyland and tech firms."),
                _buildAnimatedCard(3, Icons.directions_bus, "Campus & Student\nFacilities", "Separate Boys & Girls Hostels managed by Priests and Sisters, with college bus transportation across Palakkad"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // കാർഡുകൾക്കുള്ള അനിമേഷൻ വിഡ്ജറ്റ്
  Widget _buildAnimatedCard(int index, IconData icon, String title, String description) {
    final Animation<double> animation = CurvedAnimation(
      parent: _cardsController,
      curve: Interval(
        index * 0.15, 
        1.0,
        curve: Curves.easeOutCubic,
      ),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-0.2, 0), end: Offset.zero).animate(animation),
        child: Container(
          width: 210,
          margin: const EdgeInsets.only(right: 16, bottom: 10),
          decoration: BoxDecoration(
            // സ്ക്രീൻഷോട്ടിലെ പോലെ തിളങ്ങുന്ന കടുംനീല ഗ്രേഡിയന്റ്
            gradient: LinearGradient(
              colors: [const Color(0xFF1E3A68), const Color(0xFF0F2547)], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: primaryNavy.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
            border: Border.all(color: accentGold.withOpacity(0.3), width: 1),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: accentGold.withOpacity(0.15),
                        shape: BoxShape.circle,
                        border: Border.all(color: accentGold.withOpacity(0.5), width: 1),
                      ),
                      child: Icon(icon, color: accentGold, size: 32),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15, 
                        fontWeight: FontWeight.bold, 
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Expanded ഉപയോഗിച്ച് ടെക്സ്റ്റ് Overflow ആകാതെ നോക്കുന്നു
                    Expanded(
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11.5, 
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}