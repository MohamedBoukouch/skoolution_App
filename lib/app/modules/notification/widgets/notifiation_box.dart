import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationBox extends StatelessWidget {
  final String title;
  final String message;
  final DateTime time;
  final bool isRead;
  final String imagePath;

  const NotificationBox({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.imagePath,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
      decoration: BoxDecoration(
        color: isRead ? Colors.white: Colors.blue[50],
        // borderRadius: BorderRadius.circular(12),
         border: Border(
          bottom: BorderSide( // Only bottom border
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Circular image on the left
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Changed to circle
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
          
          // Notification content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12, right: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isRead ? Colors.grey[600] : Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      color: isRead ? Colors.grey[600] : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _formatTime(time),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    
    if (difference.inDays > 0) {
      return 'Il y a ${difference.inDays}j';
    } else if (difference.inHours > 0) {
      return 'Il y a ${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return 'Il y a ${difference.inMinutes}min';
    } else {
      return 'À l\'instant';
    }
  }
}