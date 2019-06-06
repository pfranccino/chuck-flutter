class Joke {
  dynamic categories;
  String createdAt;
  String iconUrl;
  String id;
  String updatedAt;
  String url;
  String value;

  Joke({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    this.value,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
        categories  : json['categories'],
        createdAt   : json['created_at'],
        iconUrl     : json['icon_url'],
        id          : json['id'],
        updatedAt   : json['update_at'],
        url         : json['url'],
        value       : json['value']);
  }
}
