class Employee {
  // Attributes
  String _name;
  String _nationalID;
  static const double _salary = 1500.0;
  String _gender;
  int _availableVacations;
  static const double _deductionPerDay = 85.5;
  int _availablePermissionHours;
  static const double _deductionPerHour = 15.5;
  double _actualSalary;

  // Constructors
  Employee()
      : _name = '',
        _nationalID = '',
        _gender = 'm',
        _availableVacations = 15,
        _availablePermissionHours = 20,
        _actualSalary = _salary;

  Employee.parameterized(this._name, this._nationalID, {String gender = 'm'})
      : _gender = gender,
        _availableVacations = 15,
        _availablePermissionHours = 20,
        _actualSalary = _salary;

  // Getters
  String get name => _name;
  String get nationalID => _nationalID;
  static double get salary => _salary;
  String get gender => _gender;
  int get availableVacations => _availableVacations;
  static double get deductionPerDay => _deductionPerDay;
  int get availablePermissionHours => _availablePermissionHours;
  static double get deductionPerHour => _deductionPerHour;
  double get actualSalary => _actualSalary;

  // Setters
  set name(String value) => _name = value;
  set nationalID(String value) => _nationalID = value;
  set gender(String value) => _gender = value;

  set availableVacations(int value) {
    _availableVacations = value;
    _calculateActualSalary();
  }

  set availablePermissionHours(int value) {
    _availablePermissionHours = value;
    _calculateActualSalary();
  }

  // Private method to calculate actual salary
  void _calculateActualSalary() {
    double deductions = 0.0;

    // Calculate vacation deductions (days used = initial 15 - available)
    int vacationDaysUsed = 15 - _availableVacations;
    deductions += vacationDaysUsed * _deductionPerDay;

    // Calculate permission hour deductions (hours used = initial 20 - available)
    int permissionHoursUsed = 20 - _availablePermissionHours;
    deductions += permissionHoursUsed * _deductionPerHour;

    _actualSalary = _salary - deductions;
  }

  // View method
  void view() {
    print('Name: $_name');
    print('National ID: $_nationalID');
    print('Actual Salary: ${_actualSalary.toStringAsFixed(2)} pounds');
  }

  // Detailed view method
  void viewDetailed() {
    view(); // Call the basic view first

    print('\nAdditional Details:');
    print('Base Salary: ${_salary.toStringAsFixed(2)} pounds');
    print('Gender: ${_gender == 'm' ? 'Male' : 'Female'}');
    print('Available Vacations: $_availableVacations days');
    print('Deduction per Vacation Day: ${_deductionPerDay.toStringAsFixed(2)} pounds');
    print('Available Permission Hours: $_availablePermissionHours hours');
    print('Deduction per Permission Hour: ${_deductionPerHour.toStringAsFixed(2)} pounds');

    // Calculate and show deductions
    int vacationDaysUsed = 15 - _availableVacations;
    double vacationDeductions = vacationDaysUsed * _deductionPerDay;

    int permissionHoursUsed = 20 - _availablePermissionHours;
    double permissionDeductions = permissionHoursUsed * _deductionPerHour;

    print('\nDeductions Breakdown:');
    print('Vacation Days Used: $vacationDaysUsed days (${vacationDeductions.toStringAsFixed(2)} pounds)');
    print('Permission Hours Used: $permissionHoursUsed hours (${permissionDeductions.toStringAsFixed(2)} pounds)');
    print('Total Deductions: ${(vacationDeductions + permissionDeductions).toStringAsFixed(2)} pounds');
  }
}

// Example usage
void main() {
  // Create employee with default constructor
  var emp1 = Employee();
  emp1.name = 'John Doe';
  emp1.nationalID = '123456789';

  // Create employee with parameterized constructor
  var emp2 = Employee.parameterized('Jane Smith', '987654321', gender: 'f');

  // Use some vacations and permissions
  emp1.availableVacations = 10; // used 5 days
  emp1.availablePermissionHours = 15; // used 5 hours

  // View employee details
  print('Basic View:');
  emp1.view();

  print('\nDetailed View:');
  emp1.viewDetailed();

  print('\nSecond Employee:');
  emp2.viewDetailed();
}