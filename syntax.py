# Python script for testing syntax highlighting

class SyntaxTester:
    def __init__(self, name):
        self.name = name

    def greeting(self):
        print("Hello,", self.name)

    def add_numbers(self, a, b):
        return a + b

    def multiply_numbers(self, a, b):
        return a * b

    def divide_numbers(self, a, b):
        try:
            return a / b
        except ZeroDivisionError:
            print("Error: Division by zero!")
            return None

# Instantiate SyntaxTester object
tester = SyntaxTester("John")

# Call methods
tester.greeting()
sum_result = tester.add_numbers(5, 10)
product_result = tester.multiply_numbers(3, 4)
division_result = tester.divide_numbers(10, 2)

# Print results
print("Sum Result:", sum_result)
print("Product Result:", product_result)
print("Division Result:", division_result)