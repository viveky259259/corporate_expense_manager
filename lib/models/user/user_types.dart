enum UserType { human_resource, employee }

class UserTypeHelper {
static  List<UserType> getAll() {
    return [UserType.human_resource, UserType.employee];
  }

static String getStringFromType(UserType type) {
    switch (type) {
      case UserType.human_resource:
        return 'Human Resource';
      case UserType.employee:
        return 'Employee';
      default:
        return 'Employee';
    }
  }

static UserType getTypeFromString(String string) {
    switch (string) {
      case 'human_resource':
      case 'Human Resource':
        return UserType.human_resource;

      case 'employee':
      case 'Employee':
        return UserType.employee;
      default:
        return UserType.employee;
    }
  }
}
