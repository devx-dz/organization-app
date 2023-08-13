part of '../events_screen.dart';

class EventsWidget extends StatelessWidget {
  final Event event;
  const EventsWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      width: double.infinity,
      decoration: kBoxDecorationForEvent.copyWith(boxShadow: [
        const BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          blurRadius: 1,
          spreadRadius: 0,
          offset: Offset(
            0,
            1,
          ),
        )
      ]),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: kBoxDecorationForEvent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: event.image,
                child: AspectRatio(
                  aspectRatio: 4 / 2,
                  child: CustomImage(
                    uri: event.image,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(event.name,
                    style: Theme.of(context).textTheme.titleMedium),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      IconlyBold.location,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(event.place ?? "Online",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        EventsDetails.routeName,
                        arguments: event,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Discover',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: kRed, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          IconlyLight.arrow_right,
                          color: kRed,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EventShimmer extends StatelessWidget {
  const EventShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: 180.h,
      ),
    );
  }
}
