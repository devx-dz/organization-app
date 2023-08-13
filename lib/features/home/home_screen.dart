import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/shared/widgets/error_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/const.dart';
import '../../shared/widgets/custom_image.dart';
import 'post_cubit/posts_cubit.dart';

part 'widgets/post.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PostsCubit>().getPosts();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
              ),
              Text(
                "Find The best GDG event to contribute !",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<PostsCubit, PostsState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => Column(
                            children: List.generate(
                              3,
                              (index) => const PostShimmer(),
                            ),
                          ),
                      loaded: (posts) => Column(
                            children: posts
                                .map((e) => Column(
                                      children: [
                                        PostWidget(
                                          name: e.fullName,
                                          time: e.messagetime,
                                          desc: e.body,
                                          image: e.photo ?? " ",
                                          profileImage: e.postedBy!.image!,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ))
                                .toList(),
                          ),
                      error: (e) => RefreshIndicator(
                          onRefresh: () async {
                            context.read<PostsCubit>().getPosts();
                          },
                          child: ErrorState(err: e)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
