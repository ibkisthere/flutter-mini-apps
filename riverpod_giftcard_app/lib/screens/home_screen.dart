import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_giftcard_app/gen/colors.gen.dart';
import 'package:riverpod_giftcard_app/gen/fonts.gen.dart';
import 'package:riverpod_giftcard_app/models/card_model.dart';
import 'package:riverpod_giftcard_app/providers/filtered_cards_provider.dart';
import 'package:riverpod_giftcard_app/providers/search_query_provider.dart';
import 'package:riverpod_giftcard_app/providers/selected_category_provider.dart';
import 'package:riverpod_giftcard_app/repositories/card_repository.dart';
import 'package:riverpod_giftcard_app/utilities/card_category_extension.dart';
import 'package:riverpod_giftcard_app/widgets/apptext.dart';
import 'package:riverpod_giftcard_app/widgets/custom_bottom_nav_bar.dart';
import 'package:riverpod/riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: AppText.title('Gift Card'),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
        ),
        bottomNavigationBar: CustomNavBar(index: 0),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            _SearchBar(),
            SizedBox(
              height: 10,
            ),
            _CategoryFilters(),
            SizedBox(height: 20),
            _CardGrid(),
          ]),
        ));
  }
}

class _SearchBar extends ConsumerWidget {
  const _SearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
        child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: ColorName.lightGrey,
                hintText: 'Search Card',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none)),
            // everytime the state is updated it will call the filterCardProvider
            onChanged: ref.read(searchQueryProvider.notifier).onChange));
  }
}

class _CategoryFilters extends ConsumerWidget {
  const _CategoryFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    return SizedBox(
      height: 30,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            ...CardCategory.values.map((category) => CustomChip(
                  label: category.capitalName(),
                  isSelected: selectedCategory == category,
                  onTap: () {
                    ref
                        .read(selectedCategoryProvider.notifier)
                        .setSelectedCategory(category);
                  },
                )),const SizedBox(height: 10,)
          ]),
    );
  }
}

class _CardGrid extends ConsumerWidget {
  const _CardGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final cards = ref.watch(filteredCardsProvider);
    return cards.when(
      data: (cards) => SizedBox(
        height: size.height * 0.65,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 10.0),
            itemCount: cards.length,
            itemBuilder: ((context, index) {
              return Center(
                child: CustomGiftCard(
                  card: cards[index],
                  width: size.width * 0.425,
                ),
              );
            })),
      ),
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Center(
        child: AppText.medium('Failed to fetch card'),
      ),
    );
  }
}

class CustomGiftCard extends StatelessWidget {
  final CardModel card;
  final double width;
  final int? value;
  final bool showLabel;
  final bool showValue;

  const CustomGiftCard({
    required this.card,
    required this.width,
    this.value,
    this.showLabel = true,
    this.showValue = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
              child: Image.asset(
            card.thumbnailPath,
            fit: BoxFit.cover,
          )),
          if (showLabel) ...[
            SizedBox(
              height: 10,
            ),
            AppText.medium(card.name)
          ],
          if (showValue) ...[
            SizedBox(
              height: 10,
            ),
            Positioned(
                bottom: 10.0, right: 10.0, child: AppText.large('\$$value'))
          ]
        ],
      )
    ]);
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function()? onTap;
  const CustomChip(
      {super.key, required this.label, this.onTap, this.isSelected = false});

  // buttons have a benefit over containers with gESTURE DETECTORS - ACCCESIBILITY
  // you can use containers , but use inkwell and add semantic label
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
          decoration: BoxDecoration(
              color:
                  isSelected ? ColorName.primaryColor : ColorName.disabledGrey,
              borderRadius: BorderRadius.circular(50.0)),
          child: AppText.small(
            label,
            color: isSelected ? Colors.white : ColorName.primaryColor,
          )),
    );
  }
}
