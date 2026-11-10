import 'package:flutter/material.dart';

class StudentHomeScreen extends StatelessWidget {
  // Mock data for student details
  final String studentName = "John Doe";
  final String admissionNo = "STU1234";

  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC), // Same light background theme
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
              child: const Icon(Icons.school, color: Color(0xFF1B2A4E), size: 24),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CAMPUS CONNECT",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "ST. MARY'S POLYTECHNIC COLLEGE",
                  style: TextStyle(color: Color(0xFFF1C40F), fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: const Color(0xFFF1C40F), // Yellow bottom line
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Welcome Banner ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF1B2A4E),
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B2A4E), Color(0xFF2A3C66)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome back,",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        studentName,
                        style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Admission No: $admissionNo",
                        style: const TextStyle(color: Color(0xFFF1C40F), fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),

            // --- Quick Overview (Attendance & Calendar) ---
            Row(
              children: [
                // Attendance Overview Card
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                              child: const Icon(Icons.check_circle, color: Colors.green, size: 20),
                            ),
                            const Spacer(),
                            const Text("85%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text("Attendance Overview", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 4),
                        const Text("Overall performance is good.", style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Academic Calendar Card
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                              child: const Icon(Icons.calendar_month, color: Colors.blue, size: 20),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text("Academic Calendar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 4),
                        const Text("View upcoming events.", style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // --- Section: Academic & Leaves ---
            _buildSectionHeader("Academic & Leaves"),
            _buildModuleGrid(
              context,
              [
                _ModuleData("Attendance Mgmt", "View detailed attendance.", Icons.fact_check, Colors.orange),
                _ModuleData("Apply for Leave", "Submit new leave request.", Icons.edit_document, Colors.blue),
                _ModuleData("My Leaves", "Access the My Leaves module.", Icons.list_alt, Colors.purple),
                _ModuleData("Duty Leave App", "Apply for duty leave.", Icons.work_history, Colors.teal),
              ],
            ),
            const SizedBox(height: 30),

            // --- Section: Passes & Clearances ---
            _buildSectionHeader("Passes & Clearances"),
            _buildModuleGrid(
              context,
              [
                _ModuleData("Gate Pass Request", "Request for outpass.", Icons.door_front_door, Colors.redAccent),
                _ModuleData("Special Pass Request", "Access the Special Pass Request module.", Icons.badge, Colors.indigo),
                _ModuleData("Disciplinary Record", "View disciplinary records.", Icons.gavel, Colors.brown),
              ],
            ),
            const SizedBox(height: 30),

            // --- Section: Campus Activities ---
            _buildSectionHeader("Campus Activities"),
            _buildModuleGrid(
              context,
              [
                _ModuleData("Institutional Events & Notices", "Access notices and events.", Icons.campaign, Colors.blueGrey),
                _ModuleData("Sports & Tournaments", "Access the Sports module.", Icons.sports_soccer, Colors.green),
                _ModuleData("Sports Houses", "Access the Sports Houses module.", Icons.house, Colors.deepPurple),
                _ModuleData("Sports Particulars", "Access the Sports Particulars module.", Icons.format_list_bulleted, Colors.deepOrange),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Helper widget for Section Headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B2A4E)),
          ),
          const Text(
            "MODULES",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0),
          ),
        ],
      ),
    );
  }

  // Helper widget for Module Grid
  Widget _buildModuleGrid(BuildContext context, List<_ModuleData> modules) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: modules.map((module) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width - 56) / 2, // Calculate width for 2 columns
          child: _buildModuleCard(module),
        );
      }).toList(),
    );
  }

  // Helper widget for individual Module Card
  Widget _buildModuleCard(_ModuleData module) {
    return InkWell(
      onTap: () {
        // Add navigation logic here
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1B2A4E).withOpacity(0.1), width: 1),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: module.iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(module.icon, color: module.iconColor, size: 24),
                ),
                const Icon(Icons.arrow_forward, color: Colors.grey, size: 20),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              module.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1B2A4E)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              module.description,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// Data class for Module details
class _ModuleData {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;

  _ModuleData(this.title, this.description, this.icon, this.iconColor);
}