import 'package:flutter/material.dart';
import '../../model/character.dart';
import '../../service/apis.dart';
import '../../service/network.dart';
import 'error_page.dart';
import 'loading_page.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Network.methodGet(api: Api.apiCharacter, id: id),
      initialData: "No data",
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const ErrorPage(message: "No Data");
          case ConnectionState.waiting:
            return const LoadingPage();
          done:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return DetailSuccessPage(data1: snapshot.data!);
            } else {
              return const ErrorPage(
                  message:
                      "Something error, Please check your internet connecting!");
            }
          case ConnectionState.active:
            continue done;
        }
      },
    );
  }
}

class DetailSuccessPage extends StatelessWidget {
  final String data1;
  const DetailSuccessPage({super.key, required this.data1});

  @override
  Widget build(BuildContext context) {
    // final Attributes character = Network.parseCharacterOne(data1);
    final getData = Network.parseCharacterOne(data1);
    final character = (getData.data.attributes);

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name.toString()),
      ),
      body: SizedBox.expand(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: MediaQuery.sizeOf(context).width / 1.5,
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: character.image != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(character.image.toString()))
                      : const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/Screenshot 2023-07-12 at 04.02.42 copy.png")),
                ),
              ),
              SizedBox(
                height: 360,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        RowWidget(
                          data: character,
                          dataString: character.name,
                          text: "name",
                        ),
                        RowWidget(
                          data: character,
                          dataString: character.born,
                          text: "born",
                        ),
                        RowWidget(
                          data: character,
                          dataString: character.gender,
                          text: "gender",
                        ),
                        RowWidget(
                          data: character,
                          dataString: character.species,
                          text: "species",
                        ),
                        RowWidget(
                          data: character,
                          dataString: character.hairColor,
                          text: "hairColor",
                        ),
                        RowWidget(
                          data: character,
                          dataString: character.eyeColor,
                          text: "eyeColor",
                        ),
                        RowWidget(
                          data: character,
                          dataString: character.bloodStatus,
                          text: "bloodStatus",
                        ),
                        RowWidget(
                          data: character,
                          dataString: character.nationality,
                          text: "nationality",
                        ),
                        RowWidget(
                          data: character,
                          dataString: character.patronus,
                          text: "patronus",
                        ),
                        RowWidget(
                          data: character,
                          dataString: character.wiki,
                          text: "wiki",
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget(
      {super.key,
      required this.data,
      required this.dataString,
      required this.text});

  final Character data;
  final dataString;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          dataString != null
              ? SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.3,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "$text: ${dataString}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.green),
                    ),
                  ),
                )
              : Text(
                  "$text: nothing data",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.red),
                ),
          Icon(
            dataString == null ? Icons.cancel : Icons.check,
            color: dataString == null ? Colors.red : Colors.green,
          ),
        ],
      ),
    );
  }
}
