import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetailsUI extends StatefulWidget {
  String? name_fs, web_fs, facebook_fs, phone_fs, image_fs, lat_fs, lng_fs;

  ShowDetailsUI({
    Key? key,
    this.name_fs,
    this.web_fs,
    this.facebook_fs,
    this.phone_fs,
    this.image_fs,
    this.lat_fs,
    this.lng_fs,
  }) : super(key: key);

  @override
  State<ShowDetailsUI> createState() => _ShowDetailsUIState();
}

class _ShowDetailsUIState extends State<ShowDetailsUI> {
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.yellow,
        title: Text(
          "รายละเอียดร้าน",
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/" + widget.image_fs.toString(),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.home,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            widget.name_fs.toString(),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(widget.web_fs.toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.link,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              widget.web_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(
                            'https://fb.com/' + widget.facebook_fs.toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.facebook,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              widget.facebook_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _makePhoneCall(widget.phone_fs.toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.phone,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              widget.phone_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(
                            "https://www.google.com/maps/@${widget.lat_fs.toString()},${widget.lng_fs.toString()},15z");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.map,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              widget.lng_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
