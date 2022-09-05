import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/models/shoe_object.dart';
import 'package:flutter_shoe_app/views/search_page/search_page_view_model.dart';
import 'package:flutter_shoe_app/views/search_page/search_results_list.dart';
import 'package:stacked/stacked.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Shoe> items;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchPageViewModel>.reactive(
        viewModelBuilder: () => SearchPageViewModel(items),
        onModelReady: (model) => model.initialize(),
        builder: (context, viewModel, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                title: Container(
                  height: 38,
                  child: TextField(
                    controller: viewModel.searchField,
                    onChanged: (value) => viewModel.onTextChanged(value),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(left: 16),
                      suffixIcon: IconButton(
                          onPressed: () {
                            viewModel.searchField.clear();
                            viewModel.onTextChanged('');
                          },
                          icon: Icon(
                            viewModel.hasInput ? Icons.clear : null,
                            color: Colors.black,
                          )),
                      // const Icon(
                      //   Icons.search_rounded,
                      //   color: Colors.black,
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Avalon',
                        color: Colors.grey.shade500,
                      ),
                      hintText: 'Search Shoes',
                    ),
                    style: const TextStyle(
                      fontSize: 26,
                      fontFamily: 'Avalon',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1F2732),
                    ),
                  ),
                ),
              ),
              body: viewModel.foundShoes.isNotEmpty
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: viewModel.hideResultCount
                                ? null
                                : Text(
                                    '${viewModel.foundShoes.length.toString()} RESULTS',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff1F2732)
                                            .withOpacity(0.7)),
                                  ),
                          ),
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: viewModel.foundShoes.length,
                                itemBuilder: (context, index) =>
                                    SearchResultsList(
                                        viewModel.foundShoes[index])),
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text(
                      "No shoes found",
                    )),
            ),
          );
        });
  }
}
