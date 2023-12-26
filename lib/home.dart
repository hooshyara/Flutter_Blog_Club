import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'carousel/carousel_slider.dart';
import 'data.dart';
import 'gen/assets.gen.dart';
import 'gen/fonts.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi , jonathan !',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Assets.img.icons.notification.image(width: 32, height: 32),
                    // Assets.img.icons.logo.svg(width: 32, height: 32),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  'Explore today',
                  style: themeData.textTheme.headline4,
                ),
              ),
              _StoryList(storise: stories),
              const SizedBox(
                height: 20,
              ),
              const _CategoryList(),
              const _PostList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoruItem(
            left: index == 0 ? 32 : 8,
            right: index == categories.length - 1 ? 32 : 8,
            category: categories[index],
          );
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            initialPage: 0,
            disableCenter: true,
            autoPlay: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            scrollPhysics: const BouncingScrollPhysics()));
  }
}

class _CategoruItem extends StatelessWidget {
  final double left;
  final double right;

  final Category category;

  const _CategoruItem(
      {super.key,
        required this.category,
        required this.left,
        required this.right});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 100,
          left: 65,
          right: 65,
          bottom: 24,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(0xff0D253c),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          left: left,
          right: right,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [Color(0xff0D253c), Colors.transparent],
                end: Alignment.center,
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(32)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/img/posts/large/${category.imageFileName}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 48,
          bottom: 42,
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6!.apply(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _StoryList extends StatelessWidget {
  final List<StoryData> storise;

  const _StoryList({
    Key? key,
    required this.storise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: ListView.builder(
        itemCount: storise.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        itemBuilder: (context, index) {
          final story = storise[index];
          return _Story(story: story);
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  final StoryData story;

  const _Story({
    Key? key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileImageViewed(context)
                  : _profileImageNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(story.name),
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: const Color(0xff7B8Bb2),
        dashPattern: const [5, 3],
        radius: const Radius.circular(24),
        padding: const EdgeInsets.all(7),
        child: Container(
          width: 68,
          height: 68,
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/img/stories/${story.imageFileName}',
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 34, left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Latest News',
                  style: Theme.of(context).textTheme.headline5,
                ),
                TextButton(onPressed: () {}, child: const Text('More'))
              ],
            ),
          ),
          ListView.builder(
            itemCount: posts.length,
            itemExtent: 141,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final post = posts[index];
              return _Post(post: post);
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      height: 149,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 16,
              color: Color(
                0x1a5282FF,
              ),
            ),
          ],
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/img/posts/small/${post.imageFileName}',
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.caption,
                  style: TextStyle(
                    fontFamily:  FontFamily.avenir,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      post.likes,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2!.color,
                        fontFamily: FontFamily.avenir,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(
                      CupertinoIcons.hand_thumbsup,
                      size: 20,
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      post.time,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2!.color,
                        fontFamily: FontFamily.avenir,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(
                      CupertinoIcons.clock,
                      size: 20,
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          post.isBookmarked
                              ? CupertinoIcons.bookmark_fill
                              : CupertinoIcons.bookmark,
                          size: 20,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
