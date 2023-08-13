import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/services/authrepo.dart';
import '../models/post.dart';
import '../utils/post_api.dart';

part 'posts_cubit.freezed.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(const PostsState.initial());

  void getPosts() async {
    emit(const PostsState.loading());
    try {
      final String? token = await AuthRepo.token;
      if (token == null) {
        emit(const PostsState.initial());
      } else {
        final posts = await PostApi.getPosts(token);
        if (posts.isEmpty) {
          emit(const PostsState.error('No posts found'));
          return;
        } else {
          emit(PostsState.loaded(posts));
        }
      }
    } catch (e) {
      emit(PostsState.error(e.toString()));
    }
  }
}


