import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: themeData.colorScheme.primary,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: themeData.colorScheme.primary,
            ),
          ],
        ),
        child: InkWell(
          onTap: () => showSnackBar(context, 'Like Button is clicked'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(
                width: 8,
              ),
              Text(
                '2.1k',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: themeData.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Article'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz_rounded,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Text(
                    'Four Things Every Woman Needs To Know',
                    style: themeData.textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Assets.img.stories.story9.image(
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Richard Gervain',
                              style: themeData.textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              '2m ago',
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showSnackBar(context, 'Article is Send');
                        },
                        icon: Icon(
                          CupertinoIcons.share,
                          color: themeData.colorScheme.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showSnackBar(context, 'Bookmark Button is clicked');
                        },
                        icon: Icon(
                          CupertinoIcons.bookmark,
                          color: themeData.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  ),
                  child: Assets.img.posts.large.singlePost.image(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                  child: Text(
                    'a man sexuality is never your mind responsibility',
                    style: themeData.textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                    ' sed do eiusmod tempor incididunt ut labore et dolore'
                    ' magna aliqua. Ut enim ad minim veniam, quis nostrud'
                    ' exercitation ullamco laboris nisi ut aliquip ex ea '
                    'commodo consequat. Duis aute irure dolor in reprehenderit'
                    ' in voluptate velit esse cillum dolore eu fugiat nulla '
                    'pariatur. Excepteur sint occaecat cupidatat non proident,'
                    ' sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: themeData.textTheme.headline6,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                // width: double.infinity,
                height: 116,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0),

                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
