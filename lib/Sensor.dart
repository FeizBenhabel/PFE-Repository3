class Sensor {

int _status;
String _value;
String _id;
double _lat;
double _lng;


String get value => _value;

double get lat => _lat;

set lat(double value) {
  _lat = value;
}

double get lng => _lng;

set lng(double value) {
  _lng = value;
}

set value(String value) {
  _value = value;

}

String get id => _id;

set id(String value) {
  _id = value;

}

int get status => _status;

set status(int value) {
  _status = value;
}


}