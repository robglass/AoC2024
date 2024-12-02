
def load_input(file_path: str) -> list[str]:
    with open(file_path, 'r') as file:
        return file.read().splitlines()

def sum_numbers_from_file(file_path: str) -> int:
    numbers = load_input(file_path)
    return sum(int(number) for number in numbers if number.isdigit())
