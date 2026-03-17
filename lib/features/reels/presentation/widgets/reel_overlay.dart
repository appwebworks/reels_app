import 'package:flutter/material.dart';
import '../../domain/entities/reel.dart';

class ReelOverlay extends StatefulWidget {
  final Reel reel;

  const ReelOverlay({super.key, required this.reel});

  @override
  State<ReelOverlay> createState() => _ReelOverlayState();
}

class _ReelOverlayState extends State<ReelOverlay> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // This bottom layer allows taps to pass through
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
                stops: const [0.6, 1.0],
              ),
            ),
          ),
        ),
        // This layer contains interactive elements
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.reel.username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.reel.caption,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildActionButton(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    _isLiked ? (widget.reel.likes + 1).toString() : widget.reel.likes.toString(),
                    color: _isLiked ? Colors.red : Colors.white,
                    onTap: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                  ),
                  _buildActionButton(Icons.comment, '1.2k'),
                  _buildActionButton(Icons.send, 'Share'),
                  _buildActionButton(Icons.more_vert, ''),
                  const SizedBox(height: 20),
                  const ReelMusicDisk(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, {Color color = Colors.white, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            if (label.isNotEmpty)
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}

class ReelMusicDisk extends StatelessWidget {
  const ReelMusicDisk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: const Icon(Icons.music_note, color: Colors.white, size: 20),
    );
  }
}
