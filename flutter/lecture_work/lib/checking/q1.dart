void main(){
  var a = {
    "HELLO":"bolo",
    5:"six"
  };
  a.forEach((key,value) => print("${key.runtimeType} ${value.runtimeType}"));
}

Function hello(){
  return (){
    print("Hello");
  };
}
