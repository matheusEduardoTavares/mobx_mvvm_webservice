import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test_recrutamento/app/core/utils/routes_definition_utils.dart';
import 'package:flutter_test_recrutamento/app/core/widgets/custom_error_widget/custom_error_widget.dart';
import 'package:flutter_test_recrutamento/app/core/widgets/loading_widget/loading_widget.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/models/census_names_model.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/viewmodel/census_names_viewmodel.dart';

class CensusNamesView extends StatefulWidget {
  const CensusNamesView({ 
    Key? key,
    required CensusNamesViewmodel viewmodel,
  }) : 
  _viewmodel = viewmodel,
  super(key: key);

  final CensusNamesViewmodel _viewmodel;

  @override
  State<CensusNamesView> createState() => _CensusNamesViewState();
}

class _CensusNamesViewState extends State<CensusNamesView> {
  @override
  void initState() {
    super.initState();

    widget._viewmodel.getCensusNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nomes do Censo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Observer(
            builder: (_) => FutureBuilder<List<CensusNamesModel>>(
              future: widget._viewmodel.censusNames,
              builder: (_, snapshot) {
                switch (snapshot.connectionState){
                  case ConnectionState.none:
                    return const SizedBox.shrink();
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return const LoadingWidget();
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      return ListView.separated(
                        separatorBuilder: (_, index) => const SizedBox(height: 5,),
                        shrinkWrap: true,
                        itemCount: snapshot.requireData.length,
                        itemBuilder: (_, index) {
                          final censusName = snapshot.requireData[index];
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Modular.to.pushNamed(
                                  RoutesDefinitionUtils.specificCensusName,
                                  arguments: censusName.name,
                                );
                              },
                              title: Text('Ranking: ${censusName.rank}'),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(censusName.name),
                                ],
                              ),
                              subtitle: Text('Frequência: ${censusName.frequency}'),
                              trailing: const Icon(Icons.arrow_right),
                            ),
                          );
                        },
                      );
                    }

                    return const CustomErrorWidget();
                }
              }
            ),
          ),
        ),
      ),
    );
  }
}