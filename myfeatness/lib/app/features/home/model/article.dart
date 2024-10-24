// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Article {
  final int id;
  final String goal;
  final List<String> tags;
  final String title;
  final String author;
  final String content;
  final String imageUrl;
  final DateTime publishedDate;
  Article({
    required this.id,
    required this.goal,
    required this.tags,
    required this.title,
    required this.author,
    required this.content,
    required this.imageUrl,
    required this.publishedDate,
  });

  Article copyWith({
    int? id,
    String? goal,
    List<String>? tags,
    String? title,
    String? author,
    String? content,
    String? imageUrl,
    DateTime? publishedDate,
  }) {
    return Article(
      id: id ?? this.id,
      goal: goal ?? this.goal,
      tags: tags ?? this.tags,
      title: title ?? this.title,
      author: author ?? this.author,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedDate: publishedDate ?? this.publishedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'goal': goal,
      'tags': tags,
      'title': title,
      'author': author,
      'content': content,
      'image_url': imageUrl,
      'published_date': publishedDate.millisecondsSinceEpoch,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as int,
      goal: map['goal'] as String,
      tags: List<String>.from(map['tags'] as List),
      title: map['title'] as String,
      author: map['author'] as String,
      content: map['content'] as String,
      imageUrl: map['image_url'] as String,
      publishedDate: DateTime.parse(map['published_date'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(id: $id, goal: $goal, tags: $tags, title: $title, author: $author, content: $content, imageUrl: $imageUrl, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.goal == goal &&
        listEquals(other.tags, tags) &&
        other.title == title &&
        other.author == author &&
        other.content == content &&
        other.imageUrl == imageUrl &&
        other.publishedDate == publishedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        goal.hashCode ^
        tags.hashCode ^
        title.hashCode ^
        author.hashCode ^
        content.hashCode ^
        imageUrl.hashCode ^
        publishedDate.hashCode;
  }
}
