import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final List<Map<String, String>> students = [
    {"name": "Alex", "image": "https://i.pravatar.cc/150?img=1"},
    {"name": "Sarah", "image": "https://i.pravatar.cc/150?img=2"},
    {"name": "FF", "image": "https://i.pravatar.cc/150?img=5"},
    {"name": "VA", "image": "https://i.pravatar.cc/150?img=5"},
    {"name": "Ex", "image": "https://i.pravatar.cc/150?img=5"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(
          "Welcome Back",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        toolbarHeight: 80,
        actions: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.red,
            child: Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Courses Section (Students Container)
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Courses",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your Students",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final student = students[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  student['image']!,
                                ),
                                radius: 40,
                                backgroundColor: Colors.red,
                              ),
                              SizedBox(height: 6),
                              Text(
                                student['name']!,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Today's Schedule Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Schedule",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 16),

                  // Morning Schedule
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Morning Session",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue[700],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ScheduleCard(
                                title: "Speech Therapy",
                                subtitle: "9:00 AM - 10:00 AM",
                                color: Colors.blue,
                                icon: Icons.mic,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: ScheduleCard(
                                title: "Reading Practice",
                                subtitle: "10:30 AM - 11:30 AM",
                                color: Colors.green,
                                icon: Icons.book,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Afternoon Schedule
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Afternoon Session",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.orange[700],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ScheduleCard(
                                title: "Interactive Games",
                                subtitle: "2:00 PM - 3:00 PM",
                                color: Colors.orange,
                                icon: Icons.games,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: ScheduleCard(
                                title: "Assessment",
                                subtitle: "3:30 PM - 4:30 PM",
                                color: Colors.purple,
                                icon: Icons.assessment,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Evening Schedule
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Evening Session",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.pink[700],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ScheduleCard(
                                title: "Pronunciation",
                                subtitle: "6:00 PM - 7:00 PM",
                                color: Colors.pink,
                                icon: Icons.record_voice_over,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: ScheduleCard(
                                title: "Review Session",
                                subtitle: "7:30 PM - 8:30 PM",
                                color: Colors.teal,
                                icon: Icons.record_voice_over,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Extra space at bottom
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            label: "Activities",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Community"),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;

  const ScheduleCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          Spacer(),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }
}
