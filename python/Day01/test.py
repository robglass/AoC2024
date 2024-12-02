import unittest
from main import load_input, sum_numbers_from_file

class TestAoC2024(unittest.TestCase):
    def test_load_input(self):
        test_file = 'test_input.txt'
        with open(test_file, 'w') as file:
            file.write('1\n2\n3\n')

        result = load_input(test_file)

    def test_sum_numbers_from_file(self):
        test_file = 'test_input.txt'
        with open(test_file, 'w') as file:
            file.write('1\n2\n3\n')

        result = sum_numbers_from_file(test_file)
        self.assertEqual(result, 6)

if __name__ == '__main__':        
    unittest.main()
