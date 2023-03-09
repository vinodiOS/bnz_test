import 'dart:convert';

FoodDetails welcomeFromJson(String str) =>
    FoodDetails.fromJson(json.decode(str));

String welcomeToJson(FoodDetails data) => json.encode(data.toJson());

class FoodDetails {
  FoodDetails({
    required this.user,
    required this.reports,
  });

  User user;
  List<Report> reports;

  factory FoodDetails.fromJson(Map<String, dynamic> json) => FoodDetails(
        user: User.fromJson(json["user"]),
        reports:
            List<Report>.from(json["reports"].map((x) => Report.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "reports": List<dynamic>.from(reports.map((x) => x.toJson())),
      };
}

class Report {
  Report({
    required this.date,
    required this.optIns,
  });

  String date;
  dynamic optIns;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        date: json["date"],
        optIns: json["opt_ins"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "opt_ins": optIns,
      };
}

class OptInsClass {
  OptInsClass({
    required this.breakfast,
    this.lunch,
    required this.dinner,
  });

  Breakfast breakfast;
  Breakfast? lunch;
  Breakfast dinner;

  factory OptInsClass.fromJson(Map<String, dynamic> json) => OptInsClass(
        breakfast: breakfastValues.map[json["breakfast"]]!,
        lunch: breakfastValues.map[json["lunch"]]!,
        dinner: breakfastValues.map[json["dinner"]]!,
      );

  Map<String, dynamic> toJson() => {
        "breakfast": breakfastValues.reverse[breakfast],
        "lunch": breakfastValues.reverse[lunch],
        "dinner": breakfastValues.reverse[dinner],
      };
}

enum Breakfast { CANCELED, DELIVERED, PENDING }

final breakfastValues = EnumValues({
  "Canceled": Breakfast.CANCELED,
  "Delivered": Breakfast.DELIVERED,
  "Pending": Breakfast.PENDING
});

class User {
  User({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.email,
    this.image,
    required this.isPhoneVerified,
    this.emailVerifiedAt,
    this.emailVerificationToken,
    required this.cmFirebaseToken,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.orderCount,
    required this.empId,
    required this.departmentId,
    required this.isVeg,
    required this.isSatOpted,
  });

  int id;
  String fName;
  String lName;
  String phone;
  String email;
  dynamic image;
  int isPhoneVerified;
  dynamic emailVerifiedAt;
  dynamic emailVerificationToken;
  String cmFirebaseToken;
  DateTime createdAt;
  DateTime updatedAt;
  int status;
  int orderCount;
  String empId;
  int departmentId;
  int isVeg;
  int isSatOpted;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
        isPhoneVerified: json["is_phone_verified"],
        emailVerifiedAt: json["email_verified_at"],
        emailVerificationToken: json["email_verification_token"],
        cmFirebaseToken: json["cm_firebase_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        orderCount: json["order_count"],
        empId: json["emp_id"],
        departmentId: json["department_id"],
        isVeg: json["is_veg"],
        isSatOpted: json["is_sat_opted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": fName,
        "l_name": lName,
        "phone": phone,
        "email": email,
        "image": image,
        "is_phone_verified": isPhoneVerified,
        "email_verified_at": emailVerifiedAt,
        "email_verification_token": emailVerificationToken,
        "cm_firebase_token": cmFirebaseToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
        "order_count": orderCount,
        "emp_id": empId,
        "department_id": departmentId,
        "is_veg": isVeg,
        "is_sat_opted": isSatOpted,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
