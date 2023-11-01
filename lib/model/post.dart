enum ContentType { video, sound, noMedia }

final class Post {
  const Post({
    required this.id,
    required this.url,
    required this.placeholder,
    required this.contentType,
  });
  final String id;
  final String url;
  final String placeholder;
  final ContentType contentType;
}
