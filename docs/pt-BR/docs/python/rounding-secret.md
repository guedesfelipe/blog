# 🔐 Segredos do arredondamento

Você sabe como o `round` funciona no python por baixo dos panos? Eu também não sabia e achei interessante.


Vamos fazer alguns experimentos com o `round` com alguns cálculos:

### $\frac{7}{2}=\lfloor{3.5}\rceil\implies4$

???+ success "Exemplo no Python"

    <div class="termy">
    ```console
    # >>>$ round(7/2)
    4
    ```
    </div>

### $\frac{3}{2}=\lfloor{1.5}\rceil\implies2$

???+ success "Exemplo no Python"

    <div class="termy">
    ```console
    # >>>$ round(3/2)
    2
    ```
    </div>

### $\frac{9}{2}=\lfloor{4.5}\rceil\implies5$

<div class="termy">
```console
# >>>$ round(9/2)
4
```
</div>

!!! attention "Atenção"

    Porque o python não arredondou para 5? :thinking:

### $\frac{5}{2}=\lfloor{2.5}\rceil\implies3$

<div class="termy">
```console
# >>>$ round(5/2)
2
```
</div>

!!! attention "Atenção"

    Porque o python não arredondou para 3? :thinking:

## Por quê? :thinking:

Um pouco fora do esperado estes resultados né? Mas tudo tem uma razão :nerd:


Isso ocorre porque, em Python, a função `round` é implementada com o <a href="https://en.wikipedia.org/wiki/Rounding#Round_half_to_even" target="_blank">arredondamento bancário</a>, onde todos os valores da metade são arredondados para o número par mais próximo. <a href="https://en.wikipedia.org/wiki/IEEE_754#Roundings_to_nearest" target="_blank">IEEE 754</a> recomenda usar este arredondamento.


!!! Info 

    Institute of Electrical and Electronics Engineers - (<a href="https://www.ieee.org/" target="_blank">IEEE</a>)

<h2><a href="https://docs.python.org/3/library/functions.html#round" target="_blank">Documentação Python Round</a></h2>

!!! quote "Citação original em Inlgês"

    ## **round(number[, ndigits])**

    Return *number* rounded to *ndigits* precision after the decimal point. If *ndigits* is omitted or is `None`, it returns the nearest integer to its input.

    For the built-in types supporting round(), values are rounded to the closest multiple of 10 to the power minus *ndigits*; if two multiples are equally close, rounding is done toward the even choice (so, for example, both `round(0.5)` and `round(-0.5)` are `0`, and `round(1.5)` is `2`). Any integer value is valid for *ndigits* (positive, zero, or negative). The return value is an integer if *ndigits* is omitted or `None`. Otherwise, the return value has the same type as *number*.

    For a general Python object `number`, `round` delegates to `number.__round__`.

    !!! Note

        The behavior of `round()` for floats can be surprising: for example, `round(2.675, 2)` gives `2.67` instead of the expected `2.68`. This is not a bug: it’s a result of the fact that most decimal fractions can’t be represented exactly as a float. See <a href="https://docs.python.org/3/tutorial/floatingpoint.html#tut-fp-issues" target="_blank">Floating Point Arithmetic: Issues and Limitations</a> for more information.


Após saber disto nunca mais usarei o `round` da mesma forma. :smile:


:book: Leitura Recomendada (EN): <a href="https://stackoverflow.com/questions/45223778/is-bankers-rounding-really-more-numerically-stable/45245802#45245802" target="_blank">Is bankers rounding really more numerically stable?</a>
