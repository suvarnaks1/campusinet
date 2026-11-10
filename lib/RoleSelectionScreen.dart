import 'package:campusconnection/LoginScreen.dart';
import 'package:campusconnection/SecurityRegistrationScreen.dart';
import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B2A4E),
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.school,
                color: Color(0xFF1B2A4E),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CAMPUS CONNECT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  "ST. MARY'S POLYTECHNIC COLLEGE",
                  style: TextStyle(
                    color: Color(0xFFF1C40F),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(color: const Color(0xFFF1C40F), height: 2.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "ST. MARY'S POLYTECHNIC COLLEGE,",
              style: TextStyle(
                color: Color(0xFFF1C40F),
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const Text(
              "VALLIYODE",
              style: TextStyle(
                color: Color(0xFFF1C40F),
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Institutional Login\nPortal",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Select your assigned account portal below to\nsecurely access your workspace dashboard.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 30),

            // --- Cards ---
            _buildPortalCard(
              context: context,
              title: "Student Portal",
              description: "Initiate gate pass requests (Casual/Medical) and view attendance logs.",
              icon: Icons.school,
              onRegisterPressed: () =>
                  _navigateToRegistration(context, "Student"),
            ),
            _buildPortalCard(
              context: context,
              title: "Parent Portal",
              description: "Digital verification for student leaves and read-only access to records.",
              icon: Icons.people,
              onRegisterPressed: () =>
                  _navigateToRegistration(context, "Parent"),
            ),
            _buildPortalCard(
              context: context,
              title: "Faculty Portal",
              description: "Apply for leaves, manage substitutions, and execute assigned Add-On roles.",
              icon: Icons.person_4,
              onRegisterPressed: () =>
                  _navigateToRegistration(context, "Faculty"),
            ),
            _buildPortalCard(
              context: context,
              title: "HOD Portal",
              description: "Manage real-time queues for student gate passes and faculty leave overrides.",
              icon: Icons.key,
              onRegisterPressed: () => _navigateToRegistration(context, "HOD"),
            ),
            _buildPortalCard(
              context: context,
              title: "Principal Portal",
              description: "Review HOD verified leaves and append institutional remarks.",
              icon: Icons.account_balance,
              onRegisterPressed: () =>
                  _navigateToRegistration(context, "Principal"),
            ),
            _buildPortalCard(
              context: context,
              title: "Director Portal",
              description: "Executive Exception Loop: absolute approval and revocation privileges.",
              icon: Icons.balance,
              onRegisterPressed: () =>
                  _navigateToRegistration(context, "Director"),
            ),
            _buildPortalCard(
              context: context,
              title: "HR / Accounts Portal",
              description: "Audit 12-day faculty leave ledgers, pool tracking, and LOP data mapping.",
              icon: Icons.assessment,
              onRegisterPressed: () =>
                  _navigateToRegistration(context, "HR / Accounts"),
            ),
            _buildPortalCard(
              context: context,
              title: "Security Portal",
              description: "Front-line gatekeeper: scan student QR codes for verified entry/exit.",
              icon: Icons.security,
              onRegisterPressed: () =>
                  _navigateToRegistration(context, "Security"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // റജിസ്ട്രേഷൻ പേജിലേക്ക് പോകാൻ
  void _navigateToRegistration(BuildContext context, String roleName) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => SecurityRegistrationScreen(roleName: roleName),
      ),
    );
  }

  Widget _buildPortalCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onRegisterPressed,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF1B2A4E).withOpacity(0.2),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1B2A4E).withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1B2A4E), size: 32),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B2A4E),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B2A4E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  // തെറ്റ് തിരുത്തിയ ഭാഗം ഇവിടെയാണ്
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => LoginScreen(
                          // "Student Portal" എന്നതിൽ നിന്ന് " Portal" എന്നത് മാറ്റി "Student" മാത്രം എടുക്കുന്നു
                          roleName: title.replaceAll(" Portal", ""),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Access Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 4,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: onRegisterPressed,
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}