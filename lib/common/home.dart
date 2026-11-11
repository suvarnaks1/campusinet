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
  late AnimationController _disciplinesController;
  late AnimationController _campusLifeController;
  late AnimationController _testimonialController;
  late AnimationController _ctaController;

  @override
  void initState() {
    super.initState();

    _heroController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _statsController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _cardsController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _disciplinesController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _campusLifeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _testimonialController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _ctaController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    _startAnimations();
  }

  void _startAnimations() async {
    _heroController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _statsController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _cardsController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _disciplinesController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _campusLifeController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _testimonialController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _ctaController.forward();
  }

  @override
  void dispose() {
    _heroController.dispose();
    _statsController.dispose();
    _cardsController.dispose();
    _disciplinesController.dispose();
    _campusLifeController.dispose();
    _testimonialController.dispose();
    _ctaController.dispose();
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
            // 1. HERO SECTION
            FadeTransition(
              opacity: _heroController,
              child: SlideTransition(
                position: Tween<Offset>(begin: const Offset(0, -0.1), end: Offset.zero)
                    .animate(CurvedAnimation(parent: _heroController, curve: Curves.easeOut)),
                child: _buildHeroSection(),
              ),
            ),

            // 2. STATS SECTION
            ScaleTransition(
              scale: CurvedAnimation(parent: _statsController, curve: Curves.easeOutBack),
              child: _buildStatsSection(),
            ),

            // 3. WHY CHOOSE US SECTION
            _buildWhyChooseSection(),

            // 4. OUR DIPLOMA DISCIPLINES SECTION
            _buildDisciplinesSection(),

            // 5. NEW: CAMPUS LIFE & LATEST UPDATES
            _buildCampusLifeSection(),

            // 6. NEW: WHAT OUR SCHOLARS SAY
            _buildTestimonialsSection(),

            // 7. NEW: CALL TO ACTION
            _buildCTASection(),

            // 8. NEW: FOOTER
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  // --- HERO SECTION ---
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

  // --- STATS SECTION ---
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

  // --- WHY CHOOSE US SECTION ---
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

  Widget _buildAnimatedCard(int index, IconData icon, String title, String description) {
    final Animation<double> animation = CurvedAnimation(
      parent: _cardsController,
      curve: Interval(index * 0.15, 1.0, curve: Curves.easeOutCubic),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-0.2, 0), end: Offset.zero).animate(animation),
        child: Container(
          width: 210,
          margin: const EdgeInsets.only(right: 16, bottom: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF1E3A68), const Color(0xFF0F2547)], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: primaryNavy.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8)),
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
                      style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, height: 1.3),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: const TextStyle(color: Colors.white70, fontSize: 11.5, height: 1.4),
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

  // --- 4. OUR DIPLOMA DISCIPLINES SECTION ---
  Widget _buildDisciplinesSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
      child: Column(
        children: [
          const Text(
            "Our Diploma Disciplines",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF0F2547), fontSize: 22, fontWeight: FontWeight.w900, height: 1.2),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "Three-year comprehensive technical diploma programs approved by AICTE and affiliated to SBTE Kerala.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.5),
            ),
          ),
          const SizedBox(height: 30),
          
          SizedBox(
            height: 250, 
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildDisciplineCard(0, "Mechanical & Automobile\nEngineering", "Hands-on training in automotive mechanics, thermal engineering, workshop fabrication, and modern CAD/CAM computer design."),
                _buildDisciplineCard(1, "Computer Engineering", "Comprehensive foundation in software development, computer networking, hardware maintenance, and data communication."),
                _buildDisciplineCard(2, "Electrical, Civil & Safety\nEngineering", "Specialized streams covering power systems, structural drafting, construction technology, and industrial Fire Technology & Safety."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisciplineCard(int index, String title, String description) {
    final Animation<double> animation = CurvedAnimation(
      parent: _disciplinesController,
      curve: Interval(index * 0.15, 1.0, curve: Curves.easeOutQuart),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.2, 0), end: Offset.zero).animate(animation),
        child: Container(
          width: 260, 
          margin: const EdgeInsets.only(right: 16, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 5, color: accentGold),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(color: Color(0xFF0F2547), fontSize: 16, fontWeight: FontWeight.bold, height: 1.3),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 6,
                            style: const TextStyle(color: Colors.grey, fontSize: 12, height: 1.6),
                          ),
                        ),
                      ],
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

  // --- 5. CAMPUS LIFE & LATEST UPDATES SECTION ---
  Widget _buildCampusLifeSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
      child: Column(
        children: [
          const Text(
            "Campus Life & Latest Updates",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF0F2547), fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "Stay connected with placement drives, technical exhibitions, and campus milestones at Valliyode.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.5),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 360, // കാർഡ് ഉയരം കൂട്ടി
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildUpdateCard(0, "PLACEMENTS", "Campus Drive", "Ashok Leyland Campus Recruitment Drive", "Automobile and Mechanical diploma scholars participated in technical aptitude tests and corporate interviews conducted by Ashok Leyland."),
                _buildUpdateCard(1, "TECHNICAL EXPO", "Annual Exhibition", "Annual Polytechnic Engineering Project Expo", "Final-year students exhibited innovative engineering prototypes spanning IoT automated systems, EV conversions, and fire safety systems."),
                _buildUpdateCard(2, "CAMPUS LIFE", "Student Activities", "Campus Events", "Students take part in academic and cultural events throughout the year."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateCard(int index, String tag, String category, String title, String description) {
    final Animation<double> animation = CurvedAnimation(
      parent: _campusLifeController,
      curve: Interval(index * 0.15, 1.0, curve: Curves.easeOutCubic),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.2, 0), end: Offset.zero).animate(animation),
        child: Container(
          width: 260,
          margin: const EdgeInsets.only(right: 16, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ഇമേജ് ഭാഗം (ഇവിടെ ഒരു ഗ്രേ കളർ നൽകിയിരിക്കുന്നു)
              Container(
                height: 160,
                decoration: const BoxDecoration(
                  color: Color(0xFFBDBDBD), // ഗ്രേ പ്ലേസ്ഹോൾഡർ
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                ),
                child: Stack(
                  children: [
                    // ടാഗ് (PLACEMENTS / EXPO / LIFE)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF0F2547),
                          border: Border(left: BorderSide(color: Color(0xFFEAB308), width: 3)), // മഞ്ഞ ലൈൻ
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // കണ്ടെന്റ് ഭാഗം
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: const TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: const TextStyle(color: Color(0xFF0F2547), fontSize: 15, fontWeight: FontWeight.bold, height: 1.3),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(color: Colors.grey, fontSize: 11.5, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Read Story ലിങ്ക്
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Text("Read Story", style: TextStyle(color: Color(0xFF0F2547), fontSize: 12, fontWeight: FontWeight.bold)),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward, size: 14, color: Color(0xFF0F2547)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- 6. TESTIMONIALS SECTION ---
  Widget _buildTestimonialsSection() {
    return Container(
      color: const Color(0xFFF3F4F6), // ലൈറ്റ് ബാക്ക്ഗ്രൗണ്ട്
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
      child: Column(
        children: [
          const Text(
            "What Our Scholars Say",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF0F2547), fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          const Text(
            "Real experiences from students and alumni of St. Mary's Polytechnic College.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 30),
          
          // 2 ടെസ്റ്റിമോണിയൽ കാർഡുകൾ
          _buildTestimonialCard(
            0, 
            "\"The practical training in the Automobile and Mechanical workshops at Valliyode gave me the confidence and hands-on skills needed to clear my campus placement interview on the very first attempt.\"",
            "Jithin Raj",
            "ALUMNUS | DIPLOMA IN AUTOMOBILE ENGINEERING"
          ),
          const SizedBox(height: 20),
          _buildTestimonialCard(
            1, 
            "\"Dedicated instructors, modern computer laboratories, and disciplined campus life made my three years at St. Mary's a wonderful launching pad for my career in IT.\"",
            "Ananya Krishnan",
            "CLASS OF '25 | DIPLOMA IN COMPUTER ENGINEERING"
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(int index, String quote, String name, String role) {
    final Animation<double> animation = CurvedAnimation(
      parent: _testimonialController,
      curve: Interval(index * 0.2, 1.0, curve: Curves.easeOutQuart),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(animation),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
            ],
            border: const Border(top: BorderSide(color: Color(0xFFEAB308), width: 4)), // മുകളിൽ മഞ്ഞ ലൈൻ
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quote,
                style: const TextStyle(color: Color(0xFF374151), fontSize: 14, fontStyle: FontStyle.italic, height: 1.6),
              ),
              const SizedBox(height: 20),
              Text(
                name,
                style: const TextStyle(color: Color(0xFF0F2547), fontSize: 15, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 4),
              Text(
                role,
                style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- 7. CALL TO ACTION SECTION ---
  Widget _buildCTASection() {
    return FadeTransition(
      opacity: _ctaController,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        decoration: BoxDecoration(
          color: primaryNavy,
          // ഇമേജ് ബാക്ക്ഗ്രൗണ്ട് വേണമെങ്കിൽ ഇവിടെ Image.asset ഉപയോഗിക്കാം, നിലവിൽ നീല നിറം നൽകിയിരിക്കുന്നു
        ),
        child: Column(
          children: [
            const Text(
              "Ready to Begin Your Technical\nCareer?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, height: 1.2),
            ),
            const SizedBox(height: 16),
            const Text(
              "Admissions for the 2026-2027 Academic Year are open. Join St. Mary's Polytechnic College, Valliyode today.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 30),
            // ബട്ടണുകൾ
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentGold,
                    foregroundColor: primaryNavy,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Text("Apply for Admission", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white54),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Text("Download Prospectus", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // മൂന്നാമത്തെ ബട്ടൺ
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: primaryNavy,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: const Text("Contact Admissions Desk", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  // --- 8. FOOTER SECTION ---
  Widget _buildFooter() {
    return Container(
      color: primaryNavy,
      padding: const EdgeInsets.only(top: 40, bottom: 100, left: 24, right: 24), // താഴെ സ്പേസ് നൽകി (ബോട്ടം ബാറിന് വേണ്ടി)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 3 നിരകൾ (Columns)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // കോളേജ് നെയിം
              const Text(
                "ST. MARY'S\nPOLYTECHNIC",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, height: 1.2, letterSpacing: 1),
              ),
              const SizedBox(height: 16),
              const Text(
                "Imparting quality technical education, hands-on engineering practices, and ethical values under the Catholic Diocese of Palakkad at Valliyode.",
                style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.6),
              ),
              const SizedBox(height: 24),
              // സോഷ്യൽ ഐക്കണുകൾ
              Row(
                children: [
                  _buildSocialIcon(Icons.facebook),
                  const SizedBox(width: 12),
                  _buildSocialIcon(Icons.work), // LinkedIn പോലെ
                  const SizedBox(width: 12),
                  _buildSocialIcon(Icons.camera_alt), // Instagram പോലെ
                ],
              ),
              const SizedBox(height: 40),

              // ക്വിക്ക് നാവിഗേഷൻ
              Text("QUICK NAVIGATION", style: TextStyle(color: accentGold, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
              const SizedBox(height: 16),
              _buildFooterLink("Home Dashboard"),
              _buildFooterLink("Our Legacy & History"),
              _buildFooterLink("Admissions & Aid"),
              _buildFooterLink("Campus Portal"),
              const SizedBox(height: 40),

              // കോൺടാക്ട്
              Text("CAMPUS CONTACT", style: TextStyle(color: accentGold, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
              const SizedBox(height: 16),
              _buildContactRow(Icons.location_on, "Valliyode, Palakkad, Kerala – 678705"),
              _buildContactRow(Icons.phone, "+91 9544200103 / 04922-256240"),
              _buildContactRow(Icons.email, "smpcpkd@gmail.com"),
              const SizedBox(height: 40),

              // ന്യൂസ് ലെറ്റർ
              Text("CAMPUS & TECHNICAL\nUPDATES", style: TextStyle(color: accentGold, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.0, height: 1.4)),
              const SizedBox(height: 12),
              const Text("Stay updated with placement announcements, technical workshops, and admission notifications.", style: TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter institutional email",
                        hintStyle: const TextStyle(color: Colors.white54, fontSize: 12),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.05),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentGold,
                      foregroundColor: primaryNavy,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    child: const Text("Join", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          // അടിവര (Divider)
          Container(height: 1, color: Colors.white12),
          const SizedBox(height: 20),
          // കോപ്പിറൈറ്റ് ടെക്സ്റ്റ്
          const Center(
            child: Text(
              "© 2026 St. Mary's Polytechnic College, Valliyode. All Rights Reserved.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {},
        child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13)),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4))),
        ],
      ),
    );
  }
}