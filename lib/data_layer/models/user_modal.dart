
class UserModal {
    String name;
    String email;
    String password;
    bool isUserLoggedIn;

    UserModal({
        required this.name,
        required this.email,
        this.isUserLoggedIn = false,
        required this.password,
    });

    factory UserModal.fromJson(Map<String, dynamic> json) => UserModal(
        name: json["name"]??'',
        email: json["email"]??'',
        isUserLoggedIn:  json["isUserLoggedIn"]??false,
        password: json["password"]??'',
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "isUserLoggedIn" : isUserLoggedIn
    };
}
