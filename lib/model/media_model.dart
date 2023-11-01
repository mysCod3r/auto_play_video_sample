// sealed class PostMediaModel {
//   PostMediaModel({required this.id, required this.contentText});

//   final String id;
//   final String contentText;
// }

// class VideoModel extends PostMediaModel {
//   VideoModel({
//     required super.id,
//     required super.contentText,
//     required this.videoUrl,
//   });

//   final String videoUrl;
// }

// class SoundModel extends PostMediaModel {
//   SoundModel({
//     required super.id,
//     required super.contentText,
//     required this.soundUrl,
//     required this.imageUrl,
//   });

//   final String soundUrl;
//   final String imageUrl;
// }

// class NoMediaModel extends PostMediaModel {
//   NoMediaModel({
//     required super.id,
//     required super.contentText,
//     this.imageUrl,
//   });
//   final String? imageUrl;
// }
