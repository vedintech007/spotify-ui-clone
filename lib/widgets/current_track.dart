import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/models/current_track.dart';
import 'package:spotify_clone/utils/extentions.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const _TrackInfo(),
            const Spacer(),
            const _PlayerControllers(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) const _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo();

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          "assets/lofigirl.jpg",
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 4.0),
            Text(
              selected.artist,
              style: context.textTheme.titleMedium!.copyWith(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        const SizedBox(width: 12.0),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
          ),
        ),
      ],
    );
  }
}

class _PlayerControllers extends StatelessWidget {
  const _PlayerControllers();

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    // if (selected == null) return const SizedBox.shrink();
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 20.0,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.shuffle,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 20.0,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.skip_previous_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 34.0,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.play_circle_outline,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 20.0,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.skip_next_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 20.0,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.repeat,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Text("0:00", style: context.textTheme.bodySmall),
            const SizedBox(width: 8.0),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              selected?.duration ?? "0:00",
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.devices_outlined,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_up_outlined,
              ),
            ),
            Container(
              height: 5.0,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.fullscreen_outlined,
          ),
        ),
      ],
    );
  }
}
