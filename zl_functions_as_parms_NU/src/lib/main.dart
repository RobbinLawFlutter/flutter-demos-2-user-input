// ignore_for_file: avoid_print

void main() {
  int result1 = add(3, 5);
  print('result1: $result1');
  //add contains the address of the actual function.
  int result2 = calculator1(4, 5, add);
  print('result2: $result2');
  int result3 = calculator1(4, 5, multiply);
  print('result3: $result3');
  //multiply contains the address of the actual function.
  //int result3 = calculator2(4, 5, multiply);
  //print('result3: $result3');

  //Here drive is set to slowdrive pointer to the
  //function. Notice no () after slowdrive so it does not run.
  Car myCar1 = Car(drive: slowdrive);
  print('myCar1 is ${myCar1.drive}');
  myCar1.wheels();
  //The ! is a null check
  //because the drive property could be null.
  myCar1.drive!();
  myCar1.drive = fastdrive;
  myCar1.drive!();
  Car myCar2 = Car(drive: null);
  //This will throw an unhandled exception.
  myCar2.drive!();
}

//Top level function not inside a class
int add(int n1, int n2) {
  return (n1 + n2);
}

//Top level function not inside a class
int multiply(int n1, int n2) {
  return (n1 * n2);
}

//Top level function passing another function as a parm.
//calculation will contain the address of the function passed as arg
int calculator1(int n1, int n2, Function calculation) {
  //When calculation has () then the function at the address
  //it contains is called and run.
  return calculation(n1, n2);
}

//Top level variable equivelent to above.
Function calculator2 = (int n1, int n2, Function calculation) {
  return calculation(n1, n2);
};

class Car {
  //Class constructor with named parm that must be a function name
  //and thus will contain the address of the function.
  Car({this.drive});

  //Class member field/property that contains the address of a function.
  void Function()? drive;

  //Class member method.
  void wheels() {
    print('nice wheels');
  }
}

//Top level function, must be here
//if pointed to by class Car's drive property.
void slowdrive() {
  print('driving slow');
  //return null;
}

//Top level function.
void fastdrive() {
  print('driving fast');
}
