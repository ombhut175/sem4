// WAP to find the element that appears only once in a non-empty array of integers, where every
// other element appears twice. The solution should have linear runtime complexity and use only
// constant extra space. Example: Input: nums = [2, 2, 1], Output: 1; Input: nums = [4, 1, 2, 1, 2],
// Output: 4; Input: nums = [1], Output: 1.

void main() {
  // Example inputs
  List<int> nums1 = [2, 2, 1];
  List<int> nums2 = [4, 1, 2, 1, 2];
  List<int> nums3 = [1];

  // Finding the single number
  print(singleNumber(nums1)); // Output: 1
  print(singleNumber(nums2)); // Output: 4
  print(singleNumber(nums3)); // Output: 1
}

int singleNumber(List<int> nums) {
  int result = 0;

  // XOR all the numbers in the list
  for (int num in nums) {
    result ^= num;
  }

  return result;
}
