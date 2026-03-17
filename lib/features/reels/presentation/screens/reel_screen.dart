import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/reel_bloc.dart';
import '../bloc/reel_event.dart';
import '../bloc/reel_state.dart';
import '../widgets/reel_video_player.dart';
import '../widgets/reel_overlay.dart';
import '../../../../core/video_cache_manager.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<ReelBloc>().add(FetchReelsEvent());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _preloadVideos(List reels, int index) {
    for (var i = index + 1; i <= index + 3 && i < reels.length; i++) {
      final url = reels[i].videoUrl;
      VideoCacheManager.instance.downloadFile(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<ReelBloc, ReelState>(
        builder: (context, state) {
          if (state is ReelLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          } else if (state is ReelLoaded) {
            if (_currentIndex == 0) {
              _preloadVideos(state.reels, 0);
            }
            return PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: state.reels.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _preloadVideos(state.reels, index);
              },
              itemBuilder: (context, index) {
                final reel = state.reels[index];
                return Stack(
                  children: [
                    ReelVideoPlayer(
                      videoUrl: reel.videoUrl,
                      isVisible: index == _currentIndex,
                    ),
                    ReelOverlay(reel: reel),
                    Positioned(
                      top: 40,
                      left: 16,
                      child: Row(
                        children: const [
                          Text(
                            'Reels',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 16,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 28),
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (state is ReelError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
