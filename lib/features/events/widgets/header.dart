part of '../event_details.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            event.name,
            style: context.textTheme.titleLarge,
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              const Icon(
                IconlyBold.location,
                color: Color(0xBF151515),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(event.place ?? "Online"),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              const Icon(
                IconlyBold.time_circle,
                color: Color(0xBF151515),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                event.datedebut ?? '',
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            event.description,
            style: context.textTheme.bodyMedium,
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
