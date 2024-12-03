// WAP to accept a number and check whether the number is prime or not. Use method name
// check (int n). The method returns 1, if the number is prime otherwise, it returns 0.

void main(){
  print(checkPrime(6));
}

bool checkPrime(int n){
  // bool check = true;
  for(int i=2;i<n/2;i++){
    if(n%i==0){
      return false;
    }
  }
  return true;
}