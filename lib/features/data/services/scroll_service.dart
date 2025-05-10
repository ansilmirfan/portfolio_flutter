import 'package:flutter/widgets.dart';
import 'package:portfolio/core/constants/section_keys.dart';

class ScrollService {
  static void scrollToPosition(int index, {int retries = 5}) {
    _attemptScroll(index, index, retries: retries);
  }

  static void _attemptScroll(
    int targetIndex,
    int currentIndex, {
    int retries = 5,
  }) {
    final key = SectionKeys.sectionKeys[currentIndex];
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        alignment: 0.0,
        curve: Curves.easeInOut,
      ).then((_) {
        if (currentIndex != targetIndex) {
          // Retry scrolling to the actual target with shorter delay
          Future.delayed(const Duration(milliseconds: 16), () {
            _attemptScroll(targetIndex, targetIndex, retries: retries);
          });
        }
      });
    } else if (retries > 0) {
      // Find nearest available context that is not null
      int nearest = _findNearestWithContext(currentIndex, targetIndex);
      if (nearest != -1) {
        _attemptScroll(targetIndex, nearest, retries: retries - 1);
      } else {
        debugPrint("Scroll failed: No valid context found.");
      }
    }
  }

  static int _findNearestWithContext(int from, int target) {
    final keys = SectionKeys.sectionKeys;
    for (int i = 1; i < keys.length; i++) {
      final before = target - i;
      final after = target + i;

      if (before >= 0 && keys[before].currentContext != null) return before;
      if (after < keys.length && keys[after].currentContext != null) {
        return after;
      }
    }
    return -1;
  }
}
