import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_zoo/bloc/search/search_bloc.dart';
import 'package:planet_zoo/route_generator.dart';
import 'package:planet_zoo/theme.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    context.read<SearchBloc>().add(const SearchInitialized());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> _handleRefresh() async {
    context.read<SearchBloc>().add(const SearchInitialized());
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) => {},
        builder: (_, state) => RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        hintText: 'Search for animals...',
                        contentPadding: const EdgeInsets.all(8),
                        suffix: _controller.text.isEmpty
                            ? null
                            : InkWell(
                                onTap: () {
                                  _controller.clear();
                                  FocusScope.of(context).unfocus();
                                  BlocProvider.of<SearchBloc>(context)
                                      .add(const SearchInitialized());
                                },
                                child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.cancel)),
                              ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<SearchBloc>(context)
                            .add(SearchStarted(string: value));
                        setState(() {});
                      },
                      onSubmitted: (value) =>
                          BlocProvider.of<SearchBloc>(context)
                              .add(SearchStarted(string: value)),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: (state.classes ?? [])
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () => context.read<SearchBloc>().add(
                                      SearchWithClassNameStarted(
                                          className: e.className ?? '')),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 4.0),
                                      child: Text(
                                        e.className ?? '',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: state.status == SearchStatus.loading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: (state.showResults ?? []).length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 4.0),
                                child: InkWell(
                                  onTap: () =>
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed(animalDetailRoute,
                                              arguments: state.results![index]),
                                  child: SizedBox(
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0,
                                          left: 4,
                                          bottom: 0,
                                          right: 0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Spacer(),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 2,
                                                      blurRadius: 6,
                                                      offset:
                                                          const Offset(0, -1),
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 104,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          Text(
                                                            state
                                                                    .showResults?[
                                                                        index]
                                                                    .englishName ??
                                                                '',
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          Text(
                                                            state
                                                                    .showResults?[
                                                                        index]
                                                                    .conservationStatus ??
                                                                '',
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Spacer(),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            4.0,
                                                                        bottom:
                                                                            4.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_right_sharp,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          width: 96,
                                          height: 96,
                                          top: 0,
                                          left: 0,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 2,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, -1),
                                                ),
                                              ],
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: state
                                                      .showResults?[index]
                                                      .images ??
                                                  '',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
