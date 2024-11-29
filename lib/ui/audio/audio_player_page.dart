import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/models/music_models.dart';

class AudioPlayerPage extends StatefulWidget {
  AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  List<MusicModels> musics = [
    MusicModels(
        musicName: "O'ylamading",
        author: "Munisa Rizayeva  Shohrux",
        cover:
            "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/6d/aa/89/6daa8927-612c-9bd5-c9e0-d9ff7bf4e86c/cover.jpg/1200x1200bf-60.jpg",
        path: "music/Munisa Rizayeva  Shohrux (Ummon) - O_ylamading.mp3"),
    MusicModels(
        musicName: "Tunlari bemano kimda edi xato ",
        author: "name",
        cover:
            "https://st.depositphotos.com/1766887/1279/i/450/depositphotos_12798148-stock-photo-grunge-musical-background.jpg",
        path: "assets/music/CrVxbqYQSsc.mp3"),
    MusicModels(
        musicName: "Mama de la Mama",
        author: "El Alfa ",
        cover:
            "https://static.wikia.nocookie.net/kali-uchis/images/8/86/Elalfa.jpg",
        path: "assets/music/s5yRZOQ3EWI.mp3"),
    MusicModels(
        musicName: "So'naman",
        author: "Rahon",
        cover: "https://example.com/path/to/rayhon_cover.jpg",
        path: "assets/music/GnRGxUai8xM.mp3"),
    MusicModels(
        musicName: "Dardim",
        author: "Yunka",
        cover: "https://muznavo.net/_ld/153/31234205.jpg",
        path: "assets/music/Yunka - Dardim.mp3"),
  ];

  int currentMusic = 0;

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Audio Player",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(28),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(musics[currentMusic].cover),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              musics[currentMusic].musicName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              musics[currentMusic].author,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            ProgressBar(
              progress: const Duration(milliseconds: 1000),
              buffered: const Duration(milliseconds: 2000),
              total: const Duration(milliseconds: 5000),
              onSeek: (duration) {
                print('User selected a new time: $duration');
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_previous,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    player.state == PlayerState.playing
                        ? player.pause()
                        : player.play(AssetSource(musics[currentMusic].path));
                    print(
                        "==============================================================================================");

                    setState(() {});
                  },
                  icon: Icon(
                    player.state == PlayerState.playing
                        ? Icons.play_arrow
                        : Icons.pause,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    player.stop();
                    print("object");
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.skip_next,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
