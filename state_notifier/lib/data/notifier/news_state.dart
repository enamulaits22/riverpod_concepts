// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_app/data/model/news_model.dart';

// class NewsState {
//   List<Entry> news;
//   bool isLoading;
//   NewsState({
//     required this.news,
//     this.isLoading = true,
//   });
// }

@immutable
abstract class NewsState extends Equatable {}

class NewsLoadingState extends NewsState {
  NewsLoadingState();
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  final List<Entry> news;
  final bool enablePullUp;
  NewsLoadedState({required this.news, this.enablePullUp = true});

  @override
  List<Object?> get props => [news];
}