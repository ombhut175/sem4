// WAP to count number of even or odd number from an array of n numbers.
void main(){

}

List<int> evenOrOdd(List<int> arr){
  int ce=0,co=0;
  for(int i=0;i<arr.length;i++){
    arr[i]%2==0 ? ce++ : co++;
  }
  return [ce,co];
}