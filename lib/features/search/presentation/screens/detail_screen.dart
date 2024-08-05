import 'package:flutter/material.dart';
import 'package:itunes_song_finder/core/utils/common_strings.dart';

import '../../../../core/utils/size_config.dart';
import '../../domain/entities/results.dart';

class DetailScreen extends StatelessWidget {
  final Results result;

  const DetailScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white70,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Description',
            style:
                TextStyle(color: Colors.white, fontSize: SizeConfig.size20)),
      ),
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  result.artworkUrl100!,
                  width: SizeConfig.size100,
                  height: SizeConfig.size150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Optional: Handle error when image fails to load
                    return Icon(Icons.error,
                        size: SizeConfig.size18, color: Colors.red);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.size5),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      width: SizeConfig.size200,
                      child: Text(
                        '${result.trackName}',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: SizeConfig.size16,
                            height: 1.2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: SizeConfig.size200,
                      child: Text(
                        '${result.artistName}',
                        style: TextStyle(
                            color: Colors.yellow.shade300,
                            fontSize: SizeConfig.size16,
                            fontWeight: FontWeight.bold,
                            height: 1.2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.size30,
                    ),
                    Container(
                      width: SizeConfig.size200,
                      child: Text(
                        '${result.primaryGenreName}',
                        style: TextStyle(
                            color: Colors.orange.shade600,
                            fontSize: SizeConfig.size16,
                            fontStyle: FontStyle.italic,
                            height: 1.2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ]),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.size20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.size5),
              child: Text('Preview',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: SizeConfig.size20,
                      height: 1.2)),
            ),
            result.artworkUrl600!=null
            ? Image.network(
              result.artworkUrl600!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Optional: Handle error when image fails to load
                return Icon(Icons.error,
                    size: SizeConfig.size18, color: Colors.red);
              },
            )
            :Container(
              margin: EdgeInsets.only(top: SizeConfig.size20),
              child: Center(
                child: Text('No Preview available',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: SizeConfig.size20,
                        height: 1.2)),
              ),
            ),
            SizedBox(
              height: SizeConfig.size30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.size5),
              child: Text('Description',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: SizeConfig.size20,
                      height: 1.2)),
            ),
            result.description!=null
            ? Text(result.description!,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: SizeConfig.size20,
                    height: 1.2))
             : Text(AppStrings.ebookDescMsg,
                 style: TextStyle(
                     color: Colors.white70,
                     fontSize: SizeConfig.size18,
                     height: 1.2))
          ],
        ),
      ),
    );
  }
}
