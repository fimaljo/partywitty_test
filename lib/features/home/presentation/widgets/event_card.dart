import 'dart:ui';

import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String location;
  final String offer;
  final String dateInfo;
  final String detailInfo;
  final Color bannerColor;
  final Color offerColor;
  final Color imageColor;
  final VoidCallback? onMorePressed;
  final VoidCallback? onBookNow;
  final String avatarUrl;
  final String eventBanner;

  const EventCard({
    super.key,
    required this.title,
    required this.location,
    required this.offer,
    required this.dateInfo,
    required this.detailInfo,
    this.bannerColor = Colors.deepPurpleAccent,
    this.offerColor = Colors.yellowAccent,
    this.imageColor = Colors.red,
    this.onBookNow,
    this.onMorePressed,
    required this.avatarUrl,
    required this.eventBanner,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final sidePadding = screenWidth * 0.08; // 8% of screen width
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    avatarUrl.isEmpty
                        ? const CircleAvatar(radius: 20)
                        : CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(avatarUrl),
                          ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                        Text(location),
                      ],
                    ),
                    const Spacer(),
                    Transform.translate(
                      offset: Offset(10, 0),
                      child: IconButton(
                        onPressed: onMorePressed,
                        icon: const Icon(Icons.more_horiz),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              color: offerColor,
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                offer,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.stars_outlined, color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 400,
                        color: imageColor,
                        child: Image.asset(
                          eventBanner,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onBookNow,
                        child: Container(
                          color: bannerColor,
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text(
                                "Book Now",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  dateInfo,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                Text(
                  detailInfo,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
