import 'package:ecogrand_bank/add_income/add_income.dart';
import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/data/enums/income_type.dart';
import 'package:ecogrand_bank/data/incomes_controller.dart';
import 'package:ecogrand_bank/data/models/news.dart';
import 'package:ecogrand_bank/data/models/quiz/quiz.dart';
import 'package:ecogrand_bank/pres/quizes/quizes.dart';
import 'package:ecogrand_bank/pres/quizes/widgets/persons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.goToNews});
  final VoidCallback goToNews;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_update);
  }

  @override
  void dispose() {
    _tabController.removeListener(_update);
    _tabController.dispose();
    super.dispose();
  }

  void _update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 16,
            title: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Good morning',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xFFFCFCFC),
                    ),
                  ),
                ),
                SvgPicture.asset('assets/bell.svg'),
              ],
            ),
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddIncome(),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 90,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: CustomTheme.dividerColor),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        CustomTheme.darkGreyColor,
                        CustomTheme.greyColor,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Amount income',
                          style: TextStyle(
                            color: CustomTheme.textGreyColor,
                            fontSize: 16,
                          ),
                        ),
                        Consumer<IncomesController>(
                          builder: (BuildContext context,
                              IncomesController value, Widget? child) {
                            return Text(
                              '${value.sum()} \$',
                              style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).primaryColor,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Income',
                    style: TextStyle(
                      color: CustomTheme.textGreyColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Consumer<IncomesController>(
                  builder: (context, controller, child) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 16),
                          ...List.generate(
                            IncomeType.values.length,
                            (index) {
                              final type = IncomeType.values[index];
                              return Container(
                                margin: EdgeInsets.only(
                                    right: index == IncomeType.values.length - 1
                                        ? 16
                                        : 8),
                                padding: const EdgeInsets.all(16),
                                height: 155,
                                width: 155,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: CustomTheme.dividerColor),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(type.iconPath),
                                    const Spacer(),
                                    Text(
                                      type.title,
                                      style: const TextStyle(
                                        color: CustomTheme.whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '${controller.sum(type)} \$',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: CustomTheme.textGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    const Positioned(
                      bottom: -7,
                      left: 0,
                      right: 0,
                      child: Divider(
                        thickness: 2,
                        color: CustomTheme.dividerColor,
                      ),
                    ),
                    TabBar(
                      indicatorColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.only(
                        left: 16,
                        right: MediaQuery.of(context).size.width * 0.5,
                      ),
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Text(
                            'News',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: _tabController.index == 0
                                  ? Theme.of(context).primaryColor
                                  : const Color(0xFF333333),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Quiz',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: _tabController.index == 1
                                  ? Theme.of(context).primaryColor
                                  : const Color(0xFF333333),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 450,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      TabComponent(
                        title: '${news.length} news',
                        onViewAllTap: () => widget.goToNews(),
                        children: List.generate(
                          2,
                          (index) {
                            final n = news[index];
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              n.title,
                                              style: const TextStyle(
                                                color: CustomTheme.whiteColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              DateFormat('dd MMMM, yyyy')
                                                  .format(n.dateTime),
                                              style: TextStyle(
                                                color:
                                                    CustomTheme.textGreyColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          n.path,
                                          height: 90,
                                          width: 110,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Divider(
                                  thickness: 1,
                                  color: CustomTheme.dividerColor,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Quizes(),
                          ),
                        ),
                        child: TabComponent(
                          title: '${quizes.length} themes',
                          onViewAllTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Quizes(),
                            ),
                          ),
                          children: List.generate(
                            quizes.length,
                            (index) {
                              final quiz = quizes[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      quiz.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: CustomTheme.whiteColor,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: PersonsRow(
                                            pathes: quiz.questions
                                                .map((e) => e.person.image)
                                                .toList(),
                                          ),
                                        ),
                                        Text(
                                          DateFormat('dd MMMM, yyyy')
                                              .format(quiz.date),
                                          style: TextStyle(
                                            color: CustomTheme.textGreyColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Divider(
                                    thickness: 1,
                                    color: CustomTheme.dividerColor,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }
}

class TabComponent extends StatelessWidget {
  const TabComponent({
    super.key,
    required this.title,
    required this.children,
    required this.onViewAllTap,
  });

  final String title;
  final List<Widget> children;
  final VoidCallback onViewAllTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: CustomTheme.dividerColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: CustomTheme.textGreyColor,
                  ),
                ),
                InkWell(
                  onTap: onViewAllTap,
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            color: CustomTheme.dividerColor,
            thickness: 1,
          ),
          ...children,
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
