import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [StoryArea(), FeedList()],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, //가로로 스크롤
      child: Row(
        children: List.generate(
          10, //10개의 스토리
          (index) => UserStory(userName: 'User $index'), //UserStory 위젯 10개 생성
        ),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
  //FeedData 생성자
}

final feedDataList = [
  FeedData(userName: 'User1', likeCount: 50, content: '오늘 아침 날씨가 좋다.'),
  FeedData(userName: 'User2', likeCount: 5, content: '오늘 점심 날씨가 좋다.'),
  FeedData(userName: 'User3', likeCount: 57, content: '오늘 저녁 날씨가 좋다.'),
  FeedData(userName: 'User4', likeCount: 7, content: '오늘 아침 날씨가 좋다.'),
  FeedData(userName: 'User5', likeCount: 90, content: '오늘 점심 맛있었다.'),
  FeedData(userName: 'User6', likeCount: 55, content: '오늘 아침 맛있었다.'),
  FeedData(userName: 'User7', likeCount: 87, content: '오늘 저녁 맛있었다.'),
  FeedData(userName: 'User8', likeCount: 34, content: '오늘 울산 날씨가 좋다.'),
  FeedData(userName: 'User1', likeCount: 154, content: '오늘 대구 날씨가 좋다.'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, //해당 스크롤이 반응을 하면 곤란해지기 때문에 true로 설정
      physics: const NeverScrollableScrollPhysics(),
      //physics란? : 스크롤이 되는 것을 막아준다. //NeverScrollableScrollPhysics() : 스크롤이 되지 않는다.
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
      //바뀌는 값이 들어가고 있어서 const를 넣지 않는다.
      //feedData를 받아서 feedDataList의 index번째 FeedData를 넣어준다. -> 그럼 Feed 스크롤이 가능해진다.
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, //더보기를 양쪽 끝으로 붙여준다
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade300),
                  ),
                  const SizedBox(width: 8),
                  Text(feedData.userName),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 350,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 3, vertical: 4), //좌우 3, 상하 5
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, //북마크 아이콘을 양쪽 끝대비 오른쪽으로 붙여준다.
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.chat_bubble)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.bookmark)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: feedData.userName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: feedData.content),
              ],
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
