import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/custom_circular_loader.dart';
import '../../core/const.dart';

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    Key? key,
    required this.coverPhotoUrl,
    required this.showCoverPhotoOptions,
    this.hideEditButton = false,
    this.showBackButton = false,
  }) : super(key: key);

  final String coverPhotoUrl;
  final Function showCoverPhotoOptions;
  final bool hideEditButton;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: showBackButton ? 120.h : 40.w,
      width: showBackButton ? 140.h : 40.w,
      margin: const EdgeInsets.only(top: 5),
      child: CachedNetworkImage(
        imageUrl: coverPhotoUrl,
        imageBuilder: (context, imageProvider) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(
              top: 6,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: showBackButton
                  ? Border.all(
                      width: 3,
                      color: Colors.white,
                    )
                  : null,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: !hideEditButton
                  ? Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                      ),
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: kBlue,
                        shape: BoxShape.circle,
                      ),
                      child: SizedBox.fromSize(
                        size: const Size(22, 22),
                        child: IconButton(
                          alignment: Alignment.center,
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                          onPressed: () {
                            showCoverPhotoOptions();
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        },
        progressIndicatorBuilder: (context, url, progress) {
          return const Center(
              child: CustomLoader(
            size: 15,
          ));
        },
        errorWidget: (context, url, error) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text("Error"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
