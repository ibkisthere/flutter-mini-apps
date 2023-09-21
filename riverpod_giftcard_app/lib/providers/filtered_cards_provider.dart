import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_giftcard_app/models/card_model.dart';
import 'package:riverpod_giftcard_app/providers/search_query_provider.dart';
import 'package:riverpod_giftcard_app/providers/selected_category_provider.dart';
import 'package:riverpod_giftcard_app/repositories/card_repository.dart';

part 'filtered_cards_provider.g.dart';

@riverpod
Future<List<CardModel>> filteredCards(FilteredCardsRef ref) async {
  final CardRepository cardRepository = ref.watch(cardRepositoryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider);

  var allCards = await cardRepository.getAllCards();

  if (selectedCategory != null) {
    return allCards.where((card) {
      return card.categories.any((category) => category == selectedCategory);
    }).toList();
  }

  if (searchQuery.trim().isNotEmpty) {
    return allCards.where((card) {
      return card.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }
  return allCards;
}
