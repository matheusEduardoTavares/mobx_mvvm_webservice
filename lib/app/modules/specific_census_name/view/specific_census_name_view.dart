import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_test_recrutamento/app/core/widgets/custom_error_widget/custom_error_widget.dart';
import 'package:flutter_test_recrutamento/app/core/widgets/loading_widget/loading_widget.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/models/specific_census_name_model.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/view/widgets/row_specific_name_field_widget.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/view/widgets/title_widget.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/viewmodel/specific_census_name_viewmodel.dart';

class SpecificCensusNameView extends StatefulWidget {
  const SpecificCensusNameView({ 
    Key? key,
    required SpecificCensusNameViewmodel viewmodel,
    required this.specificCensusName,
  }) : 
  _viewmodel = viewmodel,
  super(key: key);

  final SpecificCensusNameViewmodel _viewmodel;
  final String specificCensusName;

  @override
  State<SpecificCensusNameView> createState() => _SpecificCensusNameViewState();
}

class _SpecificCensusNameViewState extends State<SpecificCensusNameView> {
  @override
  void initState() {
    super.initState();

    widget._viewmodel.getSpecificCensusName(widget.specificCensusName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Censo de ${widget.specificCensusName}',
          maxLines: 1,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Observer(
            builder: (_) => FutureBuilder<SpecificCensusNameModel?>(
              future: widget._viewmodel.specificCensusName,
              builder: (_, snapshot) {
                switch (snapshot.connectionState){
                  case ConnectionState.none:
                    return const SizedBox.shrink();
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return const LoadingWidget();
                  case ConnectionState.done:
                    if (snapshot.hasData && snapshot.data != null) {
                      final specificName = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RowSpecificNameFieldWidget(
                                title: 'Nome',
                                value: specificName.name,
                              ),
                              RowSpecificNameFieldWidget(
                                title: 'Localização',
                                value: specificName.location,
                              ),
                              RowSpecificNameFieldWidget(
                                title: 'Sexo',
                                value: widget._viewmodel.specificCensusSex,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TitleWidget(
                                  title: 'Frequências por períodos',
                                ),
                                Expanded(
                                  child: Card(
                                    child: ListView.builder(
                                      itemCount: specificName.periods.length,
                                      itemBuilder: (_, index) {
                                        final period = specificName.periods[index];
                                        return ListTile(
                                          title: Text('Período: ${period.period}'),
                                          trailing: Text('Frequência: ${period.frequency}'),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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