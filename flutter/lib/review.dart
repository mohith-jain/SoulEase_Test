import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blogs & Reviews',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: BlogsAndReviewsScreen(),
    );
  }
}

class BlogsAndReviewsScreen extends StatefulWidget {
  @override
  _BlogsAndReviewsScreenState createState() => _BlogsAndReviewsScreenState();
}

class _BlogsAndReviewsScreenState extends State<BlogsAndReviewsScreen> {
  int _selectedIndex = 0;
  final List<bool> _selectedTabs = [true, false];

  final List<Widget> _pages = [
    BlogsPage(),
    ReviewsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onToggleTab(int index) {
    setState(() {
      for (int buttonIndex = 0; buttonIndex < _selectedTabs.length; buttonIndex++) {
        _selectedTabs[buttonIndex] = buttonIndex == index;
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2EDE5), // Background color
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8.0), // Increased top padding
          child: Row(
            children: [

              Text(
                'Blogs & Reviews',
                style: TextStyle(fontSize: 30.0), // Increased font size
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[200], // Page background color behind the containers
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0), // Increased padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white, // Adjusted color for toggle button background
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Increased padding
              child: ToggleButtons(
                fillColor: Color(0xFFFBB40A),
                selectedColor: Colors.black,
                color: Colors.black,
                borderColor: Colors.transparent,
                selectedBorderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(16), // Decreased border radius
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 74.0, vertical: 15.0), // Increased padding
                    child: Text('Blogs', style: TextStyle(fontSize: 22)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Increased padding
                    child: Text('Review', style: TextStyle(fontSize: 22)),
                  ),
                ],
                isSelected: _selectedTabs,
                onPressed: _onToggleTab,
              ),
            ),
            SizedBox(height: 16.0), // Increased space below toggle buttons
            Expanded(child: _pages[_selectedIndex]),
            SizedBox(height: 16.0), // Increased space below each section
          ],
        ),
      ),
    );
  }
}

class BlogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlogCard(
            name: 'Vivek',
            content:
            'It all started a few years back. Life just felt heavy, you know? Everything seemed to go wrong, and I couldn\'t shake off the feeling of sadness that stuck with me. The days were long, and the nights even longer. I often found myself staring at the ceiling, wondering when things would get better...',
          ),
          BlogCard(
            name: 'Ashika',
            content:
            'Hi, I\'m Ashika. Losing my mom was really tough. Life felt heavy, and I couldn\'t shake off this sad feeling. Every morning, I would wake up hoping for a better day, but the weight of grief was too much to bear. I tried to stay strong, but the tears would often come uninvited...',
          ),
          BlogCard(
            name: 'Divya',
            content:
            'In my role as a mental health guide, I\'ve encountered various stories of struggle and resilience. Recently, I spoke with someone facing severe anxiety and depression. Their journey reminded me of the importance of mental health support and the strength it takes to seek help...',
          ),
          BlogCard(
            name: 'Rayan',
            content:
            'Hey, I\'m on a mental health journey. It started with anxiety, a constant battle. Then, depression set in, making each day a fight to keep through. But I found strength in sharing my story and connecting with others who understood the struggle...',
          ),
        ],
      ),
    );
  }
}

class BlogCard extends StatefulWidget {
  final String name;
  final String content;

  BlogCard({required this.name, required this.content});

  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(widget.name[0]),
                ),
                SizedBox(width: 8.0),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              _isExpanded ? widget.content : widget.content.substring(0, 100) + '...',
              overflow: TextOverflow.fade,
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _toggleExpand,
                child: Text(
                  _isExpanded ? 'Read less' : 'Read more',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green, // Changed to green color
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < 4 ? Icons.star : Icons.star_half,
                              color: Color(0xFFFBB40A),
                            );
                          }),
                        ),
                        Text(
                          '8K ratings',
                          style: TextStyle(
                            color: Colors.green, // Changed to green color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Column(
                  children: [
                    RatingBar(rating: 5.0, count: 3000),
                    RatingBar(rating: 4.0, count: 2000),
                    RatingBar(rating: 3.0, count: 800),
                    RatingBar(rating: 2.0, count: 200),
                    RatingBar(rating: 1.0, count: 200),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '5.0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green, // Changed to green color
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Assessments',
                          style: TextStyle(
                            color: Colors.green, // Changed to green color
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      children: [
                        Text(
                          '4.0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green, // Changed to green color
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Safety & Security',
                          style: TextStyle(
                            color: Colors.green, // Changed to green color
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      children: [
                        Text(
                          '4.0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green, // Changed to green color
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'App UI',
                          style: TextStyle(
                            color: Colors.green, // Changed to green color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ReviewCard(
                        name: 'Ashika',
                        review:
                        'Hi, I\'m Ashika. Losing my mom was really tough. Life felt heavy, and I couldn\'t shake off this sad feeling. Every morning, I would wake up hoping for a better day, but the weight of grief was too much to bear. I tried to stay strong, but the tears would often come uninvited...',
                      ),
                      ReviewCard(
                        name: 'Divya',
                        review:
                        'In my role as a mental health guide, I\'ve encountered various stories of struggle and resilience. Recently, I spoke with someone facing severe anxiety and depression. Their journey reminded me of the importance of mental health support and the strength it takes to seek help...',
                      ),
                      ReviewCard(
                        name: 'Vivek',
                        review:
                        'It all started a few years back. Life just felt heavy, you know? Everything seemed to go wrong, and I couldn\'t shake off the feeling of sadness that stuck with me. The days were long, and the nights even longer. I often found myself staring at the ceiling, wondering when things would get better...',
                      ),
                      ReviewCard(
                        name: 'Rayan',
                        review:
                        'Hey, I\'m on a mental health journey. It started with anxiety, a constant battle. Then, depression set in, making each day a fight to keep through. But I found strength in sharing my story and connecting with others who understood the struggle...',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class RatingBar extends StatelessWidget {
  final double rating;
  final int count;

  RatingBar({required this.rating, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rating.toString(), style: TextStyle(fontSize: 18.0)),
        SizedBox(width: 8.0),
        Expanded(
          child: LinearProgressIndicator(
            value: count / 5000, // Assuming the total count is 5000
            backgroundColor: Colors.grey[300],
            color: Color(0xFFFBB40A),
          ),
        ),
        SizedBox(width: 8.0),
        Text(count.toString()),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;

  ReviewCard({required this.name, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(name[0]),
                ),
                SizedBox(width: 8.0),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(review),
          ],
        ),
      ),
    );
  }
}
