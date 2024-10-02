import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/theme_extension.dart';

/// Whatsapp style appbar
class WhatsappAppbar extends SliverPersistentHeaderDelegate {
  /// Whatsapp style appbar
  const WhatsappAppbar({
    required this.screenWidth,
    required this.title,
    required this.profilePicture,
  });

  /// Width of the screen
  ///
  /// Used to calculate the position of the profile picture
  ///
  /// example:
  /// ```dart
  /// final screenWidth = MediaQuery.of(context).size.width;
  /// ```
  final double screenWidth;

  /// Title of the appbar
  final String title;

  /// Profile picture of the appbar
  final Widget profilePicture;

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => kToolbarHeight + 70;

  @override
  bool shouldRebuild(WhatsappAppbar oldDelegate) => true;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final relativeScroll = min(shrinkOffset, 45) / 45;
    final relativeScroll70px = min(shrinkOffset, 70) / 70;

    return Container(
      padding: const EdgeInsets.only(
        top: kToolbarHeight,
      ),
      color: ColorTween(
        begin: context.colorScheme.surface,
        end: context.colorScheme.primary,
      ).transform(relativeScroll),
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                child: IconButton(
                  onPressed: () => context.router.maybePop(),
                  icon: const BackButtonIcon(),
                  color: ColorTween(
                    begin: context.colorScheme.onSurface,
                    end: context.colorScheme.onPrimary,
                  ).transform(relativeScroll),
                ),
              ),
              Positioned(
                top: 20,
                left: 120,
                child: displayTitle(
                  relativeScroll70px,
                  relativeScroll,
                  context,
                ),
              ),
              Positioned(
                top: 5,
                left: Tween<double>(
                  begin: screenWidth / 2 - 45 - 40 + 25,
                  end: 50,
                ).transform(relativeScroll70px),
                child: displayProfilePicture(
                  relativeScroll70px,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Function to display the profile picture
  Widget displayProfilePicture(double relativeFullScrollOffset) => Transform(
        transform: Matrix4.identity()
          ..scale(
            Tween<double>(
              begin: 2.5,
              end: 1,
            ).transform(relativeFullScrollOffset),
          ),
        child: profilePicture,
      );

  /// Function to display the title
  Widget displayTitle(
    double relativeFullScrollOffset,
    double relativeScroll,
    BuildContext context,
  ) =>
      Transform(
        transform: Matrix4.identity()
          ..translate(
            Tween<double>(
              begin: -15,
              end: 0,
            ).transform(
              (relativeFullScrollOffset - 0.8) * 5,
            ),
            Tween<double>(
              begin: 24,
              end: 0,
            ).transform(
              (relativeFullScrollOffset - 0.8) * 5,
            ),
          ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: Tween<double>(
              begin: 18,
              end: 16,
            ).transform((relativeFullScrollOffset - 0.8) * 5),
            color: ColorTween(
              begin: context.colorScheme.onSurface,
              end: context.colorScheme.onPrimary,
            ).transform(relativeScroll),
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
