import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/data/models/news.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailed extends StatelessWidget {
  const NewsDetailed({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => Navigator.of(context).pop(),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: CustomTheme.whiteColor,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Back',
                    style: TextStyle(color: Color(0xFFD9D9D9), fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Text(
                news.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CustomTheme.whiteColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                style: const TextStyle(
                  color: CustomTheme.whiteColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                news.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: CustomTheme.textGreyColor,
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
