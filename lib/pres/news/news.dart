import 'package:ecogrand_bank/custom_text_field.dart';
import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/data/models/news.dart';
import 'package:ecogrand_bank/pres/news_detailed/news_detailed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  var _isSearching = false;
  List<News> _news = news;

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  void _listener() {
    setState(() {
      _news = news
          .where((element) => element.title
              .toLowerCase()
              .contains(_controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isSearching) {
          _focusNode.unfocus();
          setState(() {
            _isSearching = false;
          });
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(160),
          child: Container(
            height: 160,
            color: CustomTheme.darkGreyColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'News',
                    style: TextStyle(
                      color: CustomTheme.whiteColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                    ),
                  ),
                ),
                const Divider(
                  color: CustomTheme.dividerColor,
                  height: 32,
                  thickness: 1,
                ),
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _isSearching
                        ? CustomTextField(
                            focusNode: _focusNode,
                            controller: _controller,
                            onSubmitted: (p0) {
                              setState(() {
                                _isSearching = false;
                                _focusNode.unfocus();
                              });
                            },
                          )
                        : GestureDetector(
                            onTap: () => setState(() {
                              _isSearching = true;
                              _focusNode.requestFocus();
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                color: CustomTheme.greyColor,
                                borderRadius: BorderRadius.circular(16),
                                border:
                                    Border.all(color: CustomTheme.dividerColor),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'assets/search.svg',
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    _controller.text.isNotEmpty
                                        ? _controller.text
                                        : 'Search',
                                    style: TextStyle(
                                      color: CustomTheme.textGreyColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _news.length,
              (index) {
                final news = _news[index];
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NewsDetailed(news: news),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 24),
                        AspectRatio(
                          aspectRatio: 1.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              news.path,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          DateFormat('dd MMMM, yyyy').format(news.dateTime),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          news.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: CustomTheme.whiteColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(
                          thickness: 1,
                          color: CustomTheme.dividerColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
