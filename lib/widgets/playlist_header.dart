import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';
import 'package:spotify_clone/utils/extentions.dart';

class PlayListheader extends StatelessWidget {
  const PlayListheader({super.key, required this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("PLAYLIST", style: context.textTheme.labelSmall!.copyWith(fontSize: 12.0)),
                  const SizedBox(height: 12.0),
                  Text(playlist.name, style: context.textTheme.bodyMedium),
                  const SizedBox(height: 16.0),
                  Text(playlist.description, style: context.textTheme.titleMedium),
                  const SizedBox(height: 16.0),
                  Text(
                    "Created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}",
                    style: context.textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        _PlayListButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlayListButtons extends StatelessWidget {
  const _PlayListButtons({required this.followers});

  final String followers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: context.theme.iconTheme.color,
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: context.theme.hintColor,
            textStyle: context.theme.textTheme.bodySmall!.copyWith(
              fontSize: 12.0,
              letterSpacing: 2.0,
            ),
          ),
          child: const Text("PLAY"),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            size: 30.0,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
            size: 30.0,
          ),
        ),
        const Spacer(),
        Text(
          "FOLLOWERS\n$followers",
          textAlign: TextAlign.right,
          style: context.textTheme.labelSmall!.copyWith(
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
