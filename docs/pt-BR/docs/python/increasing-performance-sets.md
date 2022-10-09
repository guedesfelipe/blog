# ⚡️ Aumentando a performance dos conjuntos (sets)

Existe basicamente duas maneiras de declarar conjuntos(sets) no python:

```py title="Primeira Opção"
primeira_opcao = {1, 2}
```

```py title="Segunda Opção"
segunda_opcao = set([1, 2])
```

!!! Info 

    Esta abordagem chama o construtor do conjunto(set)


## 🤔 Mas qual a diferença entre eles?


Vamos ver o que o Python faz por baixo dos panos usando <a href="https://guedesfelipe.github.io/blog/python/disassembler/" target="_blank">disassembler</a>. :nerd:

## Vamos ver o byte code da primiera opção
<div class="termy">
```console
# >>>$ from dis import dis
# >>>$ 
# >>>$ dis('{1, 2}')
  1           0 LOAD_CONST               0 (1)
              2 LOAD_CONST               1 (2)
              4 BUILD_SET                2
              6 RETURN_VALUE
```
</div>

Aqui podemos ver que quem faz quase todo o trabalho é o *byte_code* especial chamado `BUILD_SET` e logo em seguida retorna o conjunto para nós, muito simple né?

## Vamos ver o byte code da segunda opção
<div class="termy">
```console
# >>>$ from dis import dis
# >>>$ 
# >>>$ dis('set([1, 2])')
  1           0 LOAD_NAME                0 (set)
              2 LOAD_CONST               0 (1)
              4 LOAD_CONST               1 (2)
              6 BUILD_LIST               2
              8 CALL_FUNCTION            1
             10 RETURN_VALUE
```
</div>

Observe que ele faz muitas coisas que o primeiro não faz, isso torna essa abordagem mais lenta ao carregar conjuntos (sets) no python, pois no lugar do `BUILD_SET` ele precisa fazer mais 3 passos, que são `LOAD_NAME`, `BUILD_LIST` e `CALL_FUNCTION`. Essa forma é mais lenta porque o interpretador python precisa pesquisar o nome do conjunto (set) para encontrar o construtor, criar uma lista e, finalmente, passá-la para o construtor.

Você pode encontrar a descrição de todos os byte codes <a href="https://docs.python.org/3/library/dis.html#python-bytecode-instructions" target="_blank">aqui</a>.

## 📈 Benchmark

Na tabela abiaxo podemos ver a diferença entre as duas maneiras e qual é a mais otimizada:

| Set Size   |  Factor | Constructor Time/s | Factor    | Without Constructor Time/s | Factor    | % Optimization |
| :--------: | :-----: | :----------------: | :-------: | :------------------------: | :-------: | :------------: |
|    1.000   |    1x   | 0.0000577s         | 1.00x     | 0.0000435s                 | 1.00x     | 24.61%         |
|   10.000   |   10x   | 0.0006500s         | 11.27x    | 0.0005280s                 | 12.14x    | 18.77%         |
|   100.000  |   100x  | 0.0097000s         | 168.11x   | 0.0094400s                 | 217.01x   | 2.68%          |
|  1.000.000 |  1.000x | 0.1050000s         | 1819.76x  | 0.1000000s                 | 2298.85x  | 4.76%          |
| 10.000.000 | 10.000x | 1.1200000s         | 19410.75x | 0.8950000s                 | 20574.71x | 18.75%         |

!!! note

    Laptop Core i5-4278U 2.60GHz executing in python 3.9.10

    ??? example "Example - Constructor Time"

        === "1.000"

            <div class="termy">
            ```console
            $ python -m timeit 'set([num for num in range(10**3)])'

            5000 loops, best of 5: 57.7 usec per loop
            ```
            </div>

        === "10.000"

            <div class="termy">
            ```console
            $ python -m timeit 'set([num for num in range(10**4)])'

            500 loops, best of 5: 650 usec per loop
            ```
            </div>

        === "100.000"

            <div class="termy">
            ```console
            $ python -m timeit 'set([num for num in range(10**5)])'

            50 loops, best of 5: 9.7 msec per loop
            ```
            </div>

        === "1.000.000"

            <div class="termy">
            ```console
            $ python -m timeit 'set([num for num in range(10**6)])'

            2 loops, best of 5: 105 msec per loop
            ```
            </div>

        === "10.000.000"

            <div class="termy">
            ```console
            $ python -m timeit 'set([num for num in range(10**7)])'

            1 loops, best of 5: 1.12 sec per loop
            ```
            </div>


    ??? example "Example - Whithout Constructor Time"

        === "1.000"

            <div class="termy">
            ```console
            $ python -m timeit '{num for num in range(10**3)}'

            5000 loops, best of 5: 43.5 usec per loop
            ```
            </div>

        === "10.000"

            <div class="termy">
            ```console
            $ python -m timeit '{num for num in range(10**4)}'

            500 loops, best of 5: 528 usec per loop
            ```
            </div>

        === "100.000"

            <div class="termy">
            ```console
            $ python -m timeit '{num for num in range(10**5)}'

            50 loops, best of 5: 9.44 msec per loop
            ```
            </div>

        === "1.000.000"

            <div class="termy">
            ```console
            $ python -m timeit '{num for num in range(10**6)}'

            2 loops, best of 5: 100 msec per loop
            ```
            </div>

        === "10.000.000"

            <div class="termy">
            ```console
            $ python -m timeit '{num for num in range(10**7)}'

            1 loops, best of 5: 895 msec per loop
            ```
            </div>




## Conclusão

Então, se um dia você precisar instanciar um conjunto (set), tente sempre usar a primeira opção, pois ela é mais otimizada. E uma dica extra: Caso precise instanciar um conjunto (set) vazio, só podemos fazer isso chamando o construtor, ok?!

Deixe seu comentário abaixo sobre o post, até a próxima! 😃
