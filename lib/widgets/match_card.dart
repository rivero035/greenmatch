import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final String course;
  final String time;
  final String status;
  final String requirement;

  const MatchCard({
    super.key,
    required this.course,
    required this.time,
    required this.status,
    required this.requirement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF1B5E20).withOpacity(0.1), shape: BoxShape.circle),
            child: const Icon(Icons.group_add, color: Color(0xFF1B5E20)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('$time • $status', style: const TextStyle(color: Colors.black87, fontSize: 14)),
                const SizedBox(height: 4),
                Text(requirement, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B5E20),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {},
            child: const Text('Join'),
          )
        ],
      ),
    );
  }
}