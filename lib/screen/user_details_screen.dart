import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_details/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatefulWidget {
  String username;
  UserDetailsScreen({required this.username});

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  var _init = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<UserProvider>(context)
          .getUserProfile(widget.username)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final size = MediaQuery.of(context).size;
    var textStyle = TextStyle(fontFamily: 'Lato', fontSize: 18);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        backgroundColor: const Color(0xff330033),
        centerTitle: true,
        elevation: 0,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.4,
                          color: Colors.white,
                        ),
                        Container(
                          height: size.height * 0.23,
                          color: const Color(0xff330033),
                        ),
                        Positioned(
                          top: size.height * 0.15,
                          left: size.width * 0.33,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0)),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Container(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color(0xff330033)),
                                    ),
                                    width: 121.0,
                                    height: 121.0,
                                    padding: EdgeInsets.all(70.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Material(
                                    child: Image.asset(
                                      'assets/images/github1.png',
                                      width: 121.0,
                                      height: 121.0,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                  ),
                                  imageUrl: '',
                                  width: 121.0,
                                  height: 121.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.18,
                          left: size.width * 0.36,
                          right: size.width * 0.18,
                          child: Text(
                            "username",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Image.asset('assets/images/github1.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Followings',
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Followings',
                        style: textStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Image.asset('assets/images/github1.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Followers',
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Followers',
                        style: textStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Image.asset('assets/images/github1.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Public Repo',
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Public Repo',
                        style: textStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
