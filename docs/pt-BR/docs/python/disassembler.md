# 🛠 Python Disassembler

Essa dica é para você que gosta de *escovar bits* e entender o que o python faz por baixo dos panos.

Python possui um módulo que *'disassembla'* seu código, ou seja, você pode analisar o bytecode do seu código!


## ⚗️ Test

Vamos testar, para isso precisamos importar o módulo chamado `dis` e utilizar conforme o exemplo abaixo:


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

## 🔎 Explicando o resultado


```python linenums="1" title="dis_example.py"
--8<-- "dis_example.py"
```

1. Importando a biblioteca `dis`.
2. Declara uma função que adiciona dois a um número.
3. Chamando a função `dis` para *disassemblar* o código e nos mostrar o bytecode.
4. Envia uma referência para o local `co_varnames[var_num]` na pilha.
5. Coloca `co_consts[consti]` na pilha. <a href="https://docs.python.org/3/library/dis.html#opcode-LOAD_CONST" target="_blank">Doc Link</a>
6. Implementa `TOS = TOS1 + TOS`. <a href="https://docs.python.org/3/library/dis.html#opcode-BINARY_ADD" target="_blank">Doc Link</a>
7. Retorna com TOS para quem chamou a função. <a href="https://docs.python.org/3/library/dis.html#opcode-RETURN_VALUE" target="_blank">Doc Link</a>


## 📖 <a href="https://docs.python.org/3/library/dis.html" target="_blank">Documentação Oficial<a>
