import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  StateCensusAnalyser stateCensus = new StateCensusAnalyser('', '', '', '');
  stateCensus.loadStateCensusData();

  CSVStates csvState = new CSVStates('', '', '', '');
  csvState.loadCSVState();
}

class StateCensusAnalyser {
  late String State;
  late String Population;

  late String AreaInSqKm;
  late String DensityPerSqKm;
  StateCensusAnalyser(
      this.State, this.Population, this.AreaInSqKm, this.DensityPerSqKm);

  StateCensusAnalyser.fromList(List<String> cols)
      : this(cols[0], cols[1], cols[2], cols[3]);

  @override
  String toString() {
    return 'StateCensusAnalyser{State:$State, Population : $Population, AreaInSqKm :$AreaInSqKm, DensityPerSqKm: $DensityPerSqKm}';
  }

  void loadStateCensusData() {
    try {
      final file = File('StateCensusData.csv');
      Stream<List> inputStream = file.openRead();
      inputStream.transform(utf8.decoder).transform(LineSplitter()).listen(
          (String line) {
        List row = line.split(',');

        State = row[0];
        Population = row[1];
        AreaInSqKm = row[2];
        DensityPerSqKm = row[3];

        print('State: $State');
        print('Population: $Population');
        print('AreainSqkm: $AreaInSqKm');
        print('DensityPerSqKm: $DensityPerSqKm\n\n');
      }, onDone: () {
        print('File closed.');
      }, onError: (e) {
        print(e.toString());
      });
    } catch (e) {
      throw Exception();
    }
  }
}

class CSVStates {
  String SrNo;
  String StateName;
  String TIN;
  String StateCode;

  CSVStates(this.SrNo, this.StateName, this.TIN, this.StateCode);

  CSVStates.fromList(List<String> cols)
      : this(cols[0], cols[1], cols[2], cols[3]);

  @override
  String toString() {
    return 'CSVStates{SrNo: $SrNo, StateName: $StateName, TIN: $TIN, StateCode: $StateCode}';
  }

  void loadCSVState() {
    try {
      final file = File('StateCode.csv');

      Stream<List> inputStream = file.openRead();
      inputStream.transform(utf8.decoder).transform(LineSplitter()).listen(
          (String line) {
        List row = line.split(',');

        SrNo = row[0];
        StateName = row[1];
        TIN = row[2];
        StateCode = row[3];

        print('SrNo: $SrNo');
        print('StateName: $StateName');
        print('TIN: $TIN');
        print('StateCode: $StateCode\n\n');
      }, onDone: () {
        print('File closed.');
      }, onError: (e) {
        print(e.toString());
      });
    } catch (e) {}
  }
}
