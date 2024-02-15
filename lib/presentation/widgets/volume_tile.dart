import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_favorite_books/core/config/types.dart';
import 'package:my_favorite_books/core/constants/color_constants.dart';
import 'package:my_favorite_books/core/constants/locale_key_constants.dart';
import 'package:my_favorite_books/core/utils/extensions/context_extensions.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';

const String _fallbackImageUrl = 'https://placehold.co/150x266/png';

final class VolumeTileWidget extends StatelessWidget {
  final VolumeItemEntity volume;
  final bool? isFavorite;
  final OnVolumePressed? onLongPress;
  final OnVolumePressed? onDoubleTap;

  const VolumeTileWidget({
    required this.volume,
    this.isFavorite,
    this.onLongPress,
    this.onDoubleTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: () {
        onLongPress?.call(volume);
      },
      onDoubleTap: () {
        onDoubleTap?.call(volume);
      },
      child: AnimatedContainer(
        height: 150.h,
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: (isFavorite ?? false)
                ? ColorConstants.borderFavoriteColor
                : ColorConstants.borderColor,
            width: 1.r,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: _NetworkImage(
                imageUrl: volume.volumeInfo.imageLinks?.thumbnail,
                fallbackUrl: _fallbackImageUrl,
              ),
            ),
            Gap(8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _BuildText(
                    volume.volumeInfo.title ?? LocaleKeyConstants.unknownText,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(thickness: 2),
                  if (volume.volumeInfo.author != null)
                    _BuildText(
                      LocaleKeyConstants.authorsWithArgs([
                        volume.volumeInfo.author!,
                      ]),
                    ),
                  if (volume.volumeInfo.publisher != null)
                    _BuildText(
                      LocaleKeyConstants.publisherWithArgs([
                        volume.volumeInfo.publisher!,
                      ]),
                    ),
                  if (volume.volumeInfo.description != null) ...[
                    Gap(8.h),
                    Expanded(
                      flex: 10,
                      child: _BuildDescription(
                        volume.volumeInfo.description!,
                      ),
                    ),
                  ],
                  const Spacer(),
                  Row(
                    children: [
                      if (volume.volumeInfo.publishedDate != null) ...[
                        _BuildText(
                          LocaleKeyConstants.publishedAtWithArgs([
                            volume.volumeInfo.publishedDate!,
                          ]),
                        ),
                        Gap(8.w),
                      ],
                      if (volume.volumeInfo.pageCount != null)
                        _BuildText(
                          LocaleKeyConstants.pagesWithArgs([
                            volume.volumeInfo.pageCount.toString(),
                          ]),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _BuildText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const _BuildText(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.textTheme.bodySmall,
      overflow: TextOverflow.ellipsis,
    );
  }
}

final class _BuildDescription extends StatefulWidget {
  final String description;

  const _BuildDescription(this.description);

  @override
  State<_BuildDescription> createState() => __BuildDescriptionState();
}

final class __BuildDescriptionState extends State<_BuildDescription> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Text(
            widget.description,
            style: context.textTheme.bodySmall,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

final class _NetworkImage extends StatelessWidget {
  const _NetworkImage({
    required this.fallbackUrl,
    required this.imageUrl,
  });

  final String? imageUrl;
  final String fallbackUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).r,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => const CircularProgressIndicator.adaptive(),
      imageUrl: imageUrl ?? fallbackUrl,
      fit: BoxFit.contain,
      width: 80.w,
    );
  }
}
