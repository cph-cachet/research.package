part of research_package_model;

class RPResult {
  String _identifier;
  DateTime _startDate;
  DateTime _endDate;
  bool _saveable;

  /// Returns unique identifier
  RPResult(this._identifier);

  String get identifier => _identifier;

  DateTime get startDate => _startDate;

  DateTime get endDate => _endDate;

  set startDate(DateTime startDate) {
    this._startDate = startDate;
  }

  set endDate(DateTime endDate) {
    this._endDate = endDate;
  }

}