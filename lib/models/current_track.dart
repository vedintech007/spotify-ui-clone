import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    // if (selected == null && selected != track) {
    selected = track;
    // } else {
    //   selected = null;
    // }
    notifyListeners();
  }
}
