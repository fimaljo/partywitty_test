import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partywitty_test/features/home/presentation/widgets/event_card.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:partywitty_test/features/navigation/presentation/bloc/navigation_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 50),
            itemBuilder: (context, index) {
              return EventCard(
                title: "Romeo Lane",
                location: "Civil Lines, North Delhi, 2018Kms",
                offer: "Flat 7% Off on Overall Bill - Pay Bill Through PW Pay",
                dateInfo: "SUNSET & SHIP 19 OCTOBER 2025",
                detailInfo: "Romeo Lane, 19 Oct, 2025, 04:00 PM",
                // onMorePressed: () {},
                // onBookNow: () {},
                avatarUrl: "assets/romeo_logo.jpg",
                eventBanner: 'assets/event_image.jpeg',
              );
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
