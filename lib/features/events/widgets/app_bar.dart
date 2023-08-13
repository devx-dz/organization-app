part of '../event_details.dart';

class EventDetailsAppBar extends StatelessWidget {
  const EventDetailsAppBar({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 390.h,
      width: double.infinity,
      decoration: kBoxDecorationForEvent,
      child: Hero(
        tag: event.image,
        child: FittedBox(
          fit: BoxFit.contain,
          child: CustomImage(
            uri: event.image,
          ),
        ),
      ),
    );
  }
}
