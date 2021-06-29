import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'dart:io';

class DataModel with ChangeNotifier {

  Future<void> mlDataModel() async {
    var rawCsvContent = await rootBundle.loadString('assets/datasets/data_clean.csv');
    var samples = DataFrame.fromRawCsv(rawCsvContent);
    final targetColumnName = 'diagnosis';
    final splits = splitData(samples, [0.8]);
    final validationData = splits[0];
    final testData = splits[1];
    final validator = CrossValidator.kFold(validationData, numberOfFolds: 5);
    final createClassifier = (DataFrame samples) =>
        KnnClassifier(
          samples,
          targetColumnName,
          4,
        );
    final testSplits = splitData(testData, [0.8]);
    final classifier = createClassifier(testSplits[0]);
    final finalScore = classifier.assess(testSplits[1], MetricType.accuracy);
    final scores = await validator.evaluate(createClassifier, MetricType.accuracy);
    final accuracy = scores.mean();
    print('accuracy on k fold validation: ${accuracy.toStringAsFixed(2)}');
    print(finalScore.toStringAsFixed(2));

    notifyListeners();
  }

  // DataFrame samplesData() async {
  //   var rawCsvContent = await rootBundle.loadString('assets/datasets/data_clean.csv');
  //   var samples = DataFrame.fromRawCsv(rawCsvContent);
  //
  //   return samples;
  // }
}