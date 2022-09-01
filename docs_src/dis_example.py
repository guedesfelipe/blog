from dis import dis # (1)


def add_two(number: int) -> int: # (2)
    return number + 2


dis(add_two) # (3)

# Result
#  2           0 LOAD_FAST                0 (number) (4)
#              2 LOAD_CONST               1 (.2.) (5)
#              4 BINARY_ADD (6)
#              6 RETURN_VALUE (7)
