# A perfect number is a positive integer that is equal to the sum of its proper divisors, excluding itself.

def is_perfect_number(n: int) -> bool:
    if n < 1:
        return False
    
    divisors = [i for i in range(1, n) if n % i == 0]
    
    return sum(divisors) == n

# Example usage
num = int(input("Enter a number: "))
if is_perfect_number(num):
    print(f"{num} is a perfect number.")
else:
    print(f"{num} is not a perfect number.")



# Explanation:
# Proper divisors of 28: 1, 2, 4, 7, 14

# Sum: 1 + 2 + 4 + 7 + 14 = 28

# Since the sum equals the number itself, 28 is a perfect number.