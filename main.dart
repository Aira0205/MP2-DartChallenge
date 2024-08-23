import 'dart:math';

class Song {
  final String title;
  final String artist;
  final int duration;

  Song(this.title, this.artist, this.duration);

  @override
  String toString() {
    return "$title - $artist ($duration seconds)";
  }
}

class Playlist {
  final String name;
  final List<Song> songs;

  Playlist(this.name) : songs = [];

  void addSong(Song song) {
    songs.add(song);
  }

  void removeSong(Song song) {
    songs.remove(song);
  }

  int getDuration() {
    return songs.fold(0, (sum, song) => sum + song.duration);
  }

  @override
  String toString() {
    return "$name:\n${songs.join('\n')}";
  }
}

class MusicFestival {
  final String name;
  final List<Playlist> stages;

  MusicFestival(this.name) : stages = [];

  void addStage(Playlist stage) {
    stages.add(stage);
  }

  void removeStage(Playlist stage) {
    stages.remove(stage);
  }

  int getTotalDuration() {
    return stages.fold(0, (sum, stage) => sum + stage.getDuration());
  }

  @override
  String toString() {
    return "$name:\n${stages.join('\n')}";
  }
}

Song generateRandomSong(String title, String artist, int duration) {
  return Song(title, artist, duration);
}

void main() {
  List<Song> taylorswiftsongs = [
    generateRandomSong("Daylight", "Taylor Swift", 293),
    generateRandomSong("Midnight Rain", "Taylor Swift", 174),
    generateRandomSong("Snow On The Beach", "Taylor Swift", 229),
    generateRandomSong("Cornelia Street", "Taylor Swift", 287),
    generateRandomSong("Cardigan", "Taylor Swift", 239),
  ];

  Playlist mainStage = Playlist("Main Stage");
  mainStage.songs.addAll(taylorswiftsongs.sublist(0, 3));

  Playlist indieStage = Playlist("Indie Stage");
  indieStage.songs.addAll(taylorswiftsongs.sublist(3, 5));

  Playlist electronicStage = Playlist("Electronic Stage");
  electronicStage.songs
      .add(generateRandomSong("Daylight", "Taylor Swift", 293));

  MusicFestival festival = MusicFestival("Taylor Swift: The Eras Concert");
  festival.addStage(mainStage);
  festival.addStage(indieStage);
  festival.addStage(electronicStage);

  int totalDuration = festival.getTotalDuration();
  print('Total Festival Duration: $totalDuration seconds');

  print('\nRandom Songs:');
  festival.stages.forEach((stage) {
    int randomIndex = Random().nextInt(stage.songs.length);
    Song randomSong = stage.songs[randomIndex];
    print('${stage.name}: $randomSong');
  });

  mainStage.songs.sort((a, b) => a.artist.compareTo(b.artist));

  // Print sorted Main Stage playlist
  print('\nMain Stage playlist sorted by artist:');
  print(mainStage);
}
