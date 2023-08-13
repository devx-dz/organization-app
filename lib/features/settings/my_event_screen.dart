import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/shared/widgets/background.dart';
import 'package:gdg_organizers_app/shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/error_state.dart';
import '../events/cubit/event_cubit.dart';
import '../events/events_screen.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({Key? key}) : super(key: key);
  static const routeName = '/myevents';

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  @override
  void initState() {
    context.read<EventCubit>().getUserEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundImage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Events'),
          centerTitle: true,
          elevation: 0,
          leading: const CustomBackButton(),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<EventCubit>().getEvents();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  BlocBuilder<EventCubit, EventState>(
                    builder: (context, state) {
                      return state.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                    4, (index) => const EventShimmer()),
                              ),
                          loaded: (events) => Column(
                              children: events
                                  .map((e) => EventsWidget(
                                        event: e,
                                      ))
                                  .toList()),
                          error: (e) => ErrorState(
                                err: e,
                              ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
