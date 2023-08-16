// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotify_clone/data/data.dart';
import 'package:spotify_clone/models/current_track.dart';
import 'package:spotify_clone/utils/extentions.dart';

class TrackList extends StatelessWidget {
  const TrackList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  final List<Song> tracks;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: context.textTheme.labelSmall!.copyWith(fontSize: 12.0),
      showCheckboxColumn: false,
      // dataRowMinHeight: 54.0,
      columns: const [
        DataColumn(label: Text("FILE")),
        DataColumn(label: Text("ARTIST")),
        DataColumn(label: Text("ALBUM")),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map(
        (e) {
          final selected = context.watch<CurrentTrackModel>().selected?.id == e.id;
          final textStyle = TextStyle(color: selected ? context.theme.hintColor : context.theme.iconTheme.color);
          return DataRow(
            cells: [
              DataCell(
                Text(
                  e.title,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  e.artist,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  e.album,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  e.duration,
                  style: textStyle,
                ),
              ),
            ],
            selected: selected,
            onSelectChanged: (_) => context.read<CurrentTrackModel>().selectTrack(e),
          );
        },
      ).toList(),
    );
  }
}
