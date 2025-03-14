// WAP to find the intersection of two integer arrays, nums1 and nums2. Each element in the
// result should appear as many times as it appears in both arrays, and the result should be
// returned in sorted order. Example: Input: nums1 = [1, 2, 2, 1], nums2 = [2, 2], Output: [2, 2];
// Input: nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4], Output: [4, 9].

import 'dart:io';

void main(){
  stdout.writeln(findIntersection([1,4,9,3,6,4,9,3,4], [4,9,3,4]));
}

List<int> findIntersection(List<int> nums1,List<int> nums2){
  List<int> ans=[];
  for(int i=0;i<nums1.length;i++){
    List<int> temp = [];
    for(int j=0;j<nums2.length;j++){
      if(nums1[i] == nums2[j]){
        temp.add(nums1[i]);
        i++;
      }
    }
    if(temp.length>ans.length){
      ans=temp;
    }
  }
  return ans;
}