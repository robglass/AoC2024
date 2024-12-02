
def load_space_delimited_file(file_path: str) -> tuple[list[int], list[int]]:
    """
    Load a space-delimited file with two columns of integers.

    Args:
        file_path (str): Path to the input file.

    Returns:
        tuple[list[int], list[int]]: Two lists representing the columns of integers.
    """
    column1 = []
    column2 = []

    with open(file_path, 'r') as file:
        for line_number, line in enumerate(file, start=1):
            # Skip empty lines
            if not line.strip():
                continue

            # Split the line and validate its format
            parts = line.split()
            if len(parts) != 2:
                raise ValueError(f'Invalid format on line {line_number}')
            try:
                num1, num2 = map(int, parts)
                column1.append(num1)
                column2.append(num2)
            except ValueError:
                raise ValueError(f'Invalid format on line {line_number}')

    return column1, column2

def validate_data(data: tuple[list[int], list[int]]) -> None:
    """
    Validate the data by ensuring that both columns have the same length.

    Args:
        data (tuple[list[int], list[int]]): A tuple of lists of integers.
    """
    if len(data[0]) != len(data[1]):
        raise ValueError('Columns must have the same length')

def sum_columns(data: tuple[[int],[int]]) -> int:
    """
    Given a tuple of lists, sort the columns by smallest to largest, 
    calculate the difference between the smallest element of each column,
    and return the sum of these differences.

    Args:
        data (tuple[int],[int]): A tuple of lists of integers

    Returns:
        int: The sum of the differences of each column
    """
    column1, column2 = map(sorted, data)
    return sum(abs(a - b) for a, b in zip(column1, column2))
    

if __name__ == '__main__':
    try:
        data = load_space_delimited_file('input.txt')
        validate_data(data)
        result = sum_columns(data)
        print(f'The sum of the differences between the columns is {result}')
    except FileNotFoundError:
        print('Error: Input file not found')
    except ValueError as e:
        print(f'Error: {e}')    
