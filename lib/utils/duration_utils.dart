class DurationUtils{

  static Duration durationInSeconds(int _duration){
    return Duration(seconds: _duration);
  }

  static Duration durationInMilliSeconds(int _duration){
    return Duration(milliseconds: _duration);
  }

  static Duration durationInMicroSeconds(int _duration){
    return Duration(microseconds: _duration);
  }

  static Duration durationInHours(int _duration){
    return Duration(hours: _duration);
  }
 
  static Duration durationInMinutes(int _duration){
    return Duration(minutes: _duration);
  }
}