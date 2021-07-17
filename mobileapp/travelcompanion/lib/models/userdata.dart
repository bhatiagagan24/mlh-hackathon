// class userdata stores the userid and the trip details of the user.

class UserData {
  var userid; // userid of the user. This is the email.
  var itemspacked; // items packed by the user for the trip. list
  var totalexpense; // total expenditure in the trip. double
  var tripbool; // 1 if user on trip and 0 if user not on trip.
  // itempspacked and totalexpense only visible when tripbool = 1
  UserData(
      {required this.userid,
      this.itemspacked,
      this.totalexpense,
      required this.tripbool});
}
