import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StrollBonfireScreen(),
  ));
}

// ✅ Simulated User Model
class UserData {
  final String name;
  final int age;
  final String question;
  final String quote;
  final String avatarPath;

  UserData({
    required this.name,
    required this.age,
    required this.question,
    required this.quote,
    required this.avatarPath,
  });
}

// ✅ Simulate API delay
Future<UserData> fetchUserData() async {
  await Future.delayed(const Duration(seconds: 2));
  return UserData(
    name: 'Angelina',
    age: 28,
    question: 'What is your favorite time\nof the day?',
    quote: '“Mine is definitely the peace in the morning.”',
    avatarPath: 'assets/images/joey.jpg',
  );
}

class StrollBonfireScreen extends StatelessWidget {
  const StrollBonfireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<UserData>(
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }

          final user = snapshot.data!;

          return Stack(
            children: [
              // Background Image
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/summy.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),

              // Gradient Overlay
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(20, 255, 255, 255),
                      Color.fromARGB(60, 0, 0, 0),
                      Color.fromARGB(230, 0, 0, 0),
                    ],
                    stops: [0.0, 0.3, 0.5, 0.63],
                  ),
                ),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),

                      // Title
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0, left: 75.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Stroll Bonfire",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                                height: 1.1,
                                letterSpacing: 1.2,
                                color: const Color(0xFFD1C4FF),
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withAlpha((0.25 * 255).toInt()),
                                    offset: const Offset(0, 2),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 0.1),

                      // Room / Timer UI
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.asset(
                          'assets/images/Room.png',
                          width: 140,
                          height: 36,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const Spacer(),

                      // Avatar + Dynamic Question
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(user.avatarPath),
                            radius: 28,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${user.name}, ${user.age}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Proxima Nova')),
                                const SizedBox(height: 8),
                                Text(user.question,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Proxima Nova',
                                    )),
                                const SizedBox(height: 8),
                                Text(user.quote,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Proxima Nova',
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Answer Options
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 3.5,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          answerOption("A", "The peace in the early mornings", false),
                          answerOption("B", "The magical golden hours", false),
                          answerOption("C", "Wind-down time after dinners", false),
                          answerOption("D", "The serenity past midnight", true),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Footer row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Pick your option.", style: TextStyle(color: Colors.white70)),
                              SizedBox(height: 2),
                              Text("See who has a similar mind.",
                                  style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/mic.png', width: 66, height: 66),
                              const SizedBox(width: 16),
                              Image.asset('assets/images/Arrow.png', width: 66, height: 66),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        width: 375,
        height: 79,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/cards.png', width: 36, height: 36, color: Colors.white70),
            Image.asset('assets/images/fire.png', width: 36, height: 36, color: Color(0xFFCCC8FF)),
            Stack(
              children: [
                Image.asset('assets/images/Chat.png', width: 36, height: 36, color: Colors.white70),
                const Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFFCCC8FF),
                    child: Text('10', style: TextStyle(fontSize: 10, color: Colors.black)),
                  ),
                )
              ],
            ),
            Image.asset('assets/images/User.png', width: 36, height: 36, color: Colors.white70),
          ],
        ),
      ),
    );
  }

  // Answer option widget
  Widget answerOption(String label, String text, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFCCC8FF).withOpacity(0.2)
            : const Color(0xFF232A2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? const Color(0xFFCCC8FF) : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 100, 100, 100),
                width: 2,
              ),
              color: Colors.transparent,
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Proxima Nova',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.05,
                letterSpacing: 0,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
