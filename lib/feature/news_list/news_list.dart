import 'package:flutter/material.dart';
import 'package:codebase_assignment/base/base_widget.dart';
import 'package:codebase_assignment/di/app/feature_module.dart';
import 'package:codebase_assignment/feature/news_list/new_list_view_model.dart';
import 'package:codebase_assignment/generated/l10n.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  NewsListPageState createState() => NewsListPageState();
}

class NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BaseWidget<NewsListViewModel>(
          providerBase: newsListViewModelProvider,
          onModelReady: (model) {},
          builder: (context, model, child) {
            if (model?.isLoading ?? false) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: model?.users.length ??
                    0 + (model?.hasMoreData ?? false ? 1 : 0),
                itemBuilder: (context, index) {
                  final user = model!.users[index];
                  return index == model.users.length + 1 && model.hasMoreData
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListTile(
                          title: Text(user.firstName),
                          subtitle: Text(user.email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                        );
                },
              );
            }
          }),
    );
  }
}
