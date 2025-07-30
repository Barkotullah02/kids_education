import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOverallProgress(),
          const SizedBox(height: 30),
          _buildWeeklyStats(),
          const SizedBox(height: 30),
          _buildSubjectProgress(),
          const SizedBox(height: 30),
          _buildAchievements(),
        ],
      ),
    );
  }

  Widget _buildOverallProgress() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4CAF50),
            Color(0xFF8BC34A),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Overall Progress',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      value: _progressAnimation.value * 0.75,
                      strokeWidth: 8,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  Text(
                    '${(_progressAnimation.value * 75).toInt()}%',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('Lessons\nCompleted', '45'),
              _buildStatItem('Hours\nLearned', '12.5'),
              _buildStatItem('Current\nStreak', '7 days'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.9),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildWeeklyStats() {
    final weeklyData = [
      {'day': 'Mon', 'hours': 2.5},
      {'day': 'Tue', 'hours': 1.8},
      {'day': 'Wed', 'hours': 3.2},
      {'day': 'Thu', 'hours': 2.1},
      {'day': 'Fri', 'hours': 2.8},
      {'day': 'Sat', 'hours': 1.5},
      {'day': 'Sun', 'hours': 2.0},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'This Week\'s Activity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: weeklyData.map((data) {
              final maxHours = 3.5;
              final height = (data['hours'] as double) / maxHours * 100;
              
              return Column(
                children: [
                  AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return Container(
                        width: 30,
                        height: height * _progressAnimation.value,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xFF4CAF50),
                              Color(0xFF8BC34A),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    data['day'] as String,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectProgress() {
    final subjects = [
      {
        'title': 'Mathematics',
        'progress': 0.85,
        'color': const Color(0xFF2196F3),
        'completed': 20,
        'total': 24,
      },
      {
        'title': 'Science',
        'progress': 0.67,
        'color': const Color(0xFF9C27B0),
        'completed': 12,
        'total': 18,
      },
      {
        'title': 'Reading',
        'progress': 0.91,
        'color': const Color(0xFFE91E63),
        'completed': 29,
        'total': 32,
      },
      {
        'title': 'Art & Craft',
        'progress': 0.53,
        'color': const Color(0xFFFF5722),
        'completed': 8,
        'total': 15,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Subject Progress',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 15),
        ...subjects.map((subject) => Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subject['title'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                      Text(
                        '${subject['completed']}/${subject['total']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: (subject['progress'] as double) * _progressAnimation.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: subject['color'] as Color,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${((subject['progress'] as double) * _progressAnimation.value * 100).toInt()}%',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildAchievements() {
    final achievements = [
      {
        'title': 'First Steps',
        'description': 'Complete your first lesson',
        'icon': Icons.star,
        'color': const Color(0xFFFFD700),
        'earned': true,
      },
      {
        'title': 'Math Wizard',
        'description': 'Complete 20 math lessons',
        'icon': Icons.calculate,
        'color': const Color(0xFF2196F3),
        'earned': true,
      },
      {
        'title': 'Reading Champion',
        'description': 'Read 30 stories',
        'icon': Icons.menu_book,
        'color': const Color(0xFFE91E63),
        'earned': true,
      },
      {
        'title': 'Science Explorer',
        'description': 'Complete 15 science experiments',
        'icon': Icons.science,
        'color': const Color(0xFF9C27B0),
        'earned': false,
      },
      {
        'title': 'Perfect Week',
        'description': 'Learn every day for a week',
        'icon': Icons.emoji_events,
        'color': const Color(0xFFFF9800),
        'earned': true,
      },
      {
        'title': 'Creative Artist',
        'description': 'Complete 10 art projects',
        'icon': Icons.palette,
        'color': const Color(0xFFFF5722),
        'earned': false,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Achievements',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.2,
          ),
          itemCount: achievements.length,
          itemBuilder: (context, index) {
            final achievement = achievements[index];
            final isEarned = achievement['earned'] as bool;
            
            return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isEarned ? Colors.white : Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
                boxShadow: isEarned
                    ? [
                        BoxShadow(
                          color: (achievement['color'] as Color).withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isEarned
                          ? (achievement['color'] as Color).withOpacity(0.1)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      achievement['icon'] as IconData,
                      size: 25,
                      color: isEarned
                          ? achievement['color'] as Color
                          : Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    achievement['title'] as String,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isEarned ? const Color(0xFF2C3E50) : Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    achievement['description'] as String,
                    style: TextStyle(
                      fontSize: 10,
                      color: isEarned ? Colors.grey[600] : Colors.grey[400],
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}