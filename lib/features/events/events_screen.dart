import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/shared/widgets/error_state.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/const.dart';
import '../../shared/widgets/custom_image.dart';
import 'cubit/event_cubit.dart';
import 'event_details.dart';
import 'models/event.dart';

part 'widgets/event_widget.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<EventCubit>().getEvents();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Events',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 15),
              BlocBuilder<EventCubit, EventState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => Column(
                            children: List.generate(
                                4, (index) => const EventShimmer()),
                          ),
                      loaded: (events) => Column(
                          children: events
                              .map((e) => EventsWidget(
                                    event: e,
                                  ))
                              .toList()),
                      error: (e) => ErrorState(err: e));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
