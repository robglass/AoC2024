import unittest
from main import load_space_delimited_file, sum_columns, validate_data

class TestAoC2024(unittest.TestCase):
    def test_load_space_delimited_file_valid_input(self):
        """
        Test that load_space_delimited_file correctly parses a valid space-delimited file.
        """
        test_file = 'test_input.txt'
        with open(test_file, 'w') as file:
            file.write('1 2\n3 4\n5 6\n')

        result = load_space_delimited_file(test_file)
        self.assertEqual(result, ([1, 3, 5], [2, 4, 6]))

    def test_load_space_delimited_file_empty_file(self):
        """
        Test that load_space_delimited_file handles an empty file gracefully.
        """
        test_file = 'test_empty.txt'
        with open(test_file, 'w') as file:
            file.write('')

        result = load_space_delimited_file(test_file)
        self.assertEqual(result, ([], []))

    def test_validate_data_invalid_format(self):
        """
        Test that load_space_delimited_file raises an error for invalid file format.
        """
        test_file = 'test_invalid.txt'
        with open(test_file, 'w') as file:
            file.write('1 2\n3\n5 6\n')

        with self.assertRaises(ValueError):
            testFile = load_space_delimited_file(test_file)
            validate_data(testFile)

    def test_sum_columns_valid_input(self):
        """
        Test sum_columns with valid input data.
        """
        data = ((1, 4, 7), (2, 5, 8))
        result = sum_columns(data)
        self.assertEqual(result, 3)

    def test_validate_data_mismatched_lengths(self):
        """
        Test validate_data raises an error for mismatched column lengths.
        """
        data = ((1, 4, 7), (2, 5))
        with self.assertRaises(ValueError):
            validate_data(data)

    def test_sum_columns_empty_columns(self):
        """
        Test sum_columns returns 0 for empty input columns.
        """
        data = ([], [])
        result = sum_columns(data)
        self.assertEqual(result, 0)

if __name__ == '__main__':
    unittest.main()
