# 🛠 Python Disassembler

This tip is for you who like to *bit diddling* and understand what python does under the hood.

Python has a module that disassembles your code, that is, you can analyze the bytecode of your code!


## ⚗️ Test

Let's test it, for that we need to import the module called `dis` and use it as shown in the example below::


<div class="termy">
```console
# >>>$ from dis import dis
# >>>$ 
# >>>$ 
# >>>$ def add_two(number: int) -> int:
# ...$     return number + 2
# >>>$ 
# >>>$ dis(add_two)

  2           0 LOAD_FAST                0 (number)
              2 LOAD_CONST               1 (2)
              4 BINARY_ADD
              6 RETURN_VALUE
```
</div>

## 🔎 Explaining the result


```python linenums="1" title="dis_example.py"
--8<-- "dis_example.py"
```

1. Importing `dis` library.
2. Declare a function that adds two to a number.
3. Calling Disassembly function to show us the bytecode.
4. Pushes a reference to the local `co_varnames[var_num]` onto the stack. <a href="https://docs.python.org/3/library/dis.html#opcode-LOAD_FAST" target="_blank">Doc Link</a>
5. Pushes `co_consts[consti]` onto the stack. <a href="https://docs.python.org/3/library/dis.html#opcode-LOAD_CONST" target="_blank">Doc Link</a>
6. Implements `TOS = TOS1 + TOS`. <a href="https://docs.python.org/3/library/dis.html#opcode-BINARY_ADD" target="_blank">Doc Link</a>
7. Returns with TOS to the caller of the function. <a href="https://docs.python.org/3/library/dis.html#opcode-RETURN_VALUE" target="_blank">Doc Link</a>


## 📖 <a href="https://docs.python.org/3/library/dis.html" target="_blank">Official Documentation<a>
