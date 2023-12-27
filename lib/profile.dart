import 'package:blog_club/data.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.background.withOpacity(0),
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz_rounded,
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color:
                            themeData.colorScheme.onBackground.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Assets.img.stories.story8
                                  .image(width: 84, height: 84),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('@joviedan'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Jovi Daniel',
                                    style:
                                        themeData.textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: themeData.textTheme.bodyText1!.apply(
                                        color: themeData.colorScheme.primary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Text(
                          'About Me',
                          style: themeData.textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text(
                          'Madison Blackstone is a director of user experience'
                          ' design with experience managing global teams',
                          style: themeData.textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 96,
                  right: 96,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: themeData.colorScheme.onBackground!
                              .withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff2151CD),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Posts',
                                  style: themeData.textTheme.bodyText1!.apply(
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Following',
                                style: themeData.textTheme.bodyText1!.apply(
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5k',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodyText1!.apply(
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 50, 20),
                        child: Text(
                          'My Post',
                          style: themeData.textTheme.headline4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 35, 20),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Assets.img.icons.grid.svg(),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Assets.img.icons.table.svg(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  for (var i = 0; i < posts.length; i++) Post(post: posts[i])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
