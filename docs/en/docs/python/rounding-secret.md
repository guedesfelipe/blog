# 🔐 Rounding Secret

Do you know how `round` works in python under the hood? I didn't know either and I thought it was interesting.


Let's do some experiments with the `round` with some calcs:

### $\frac{7}{2}=\lfloor{3.5}\rceil\implies4$

???+ success "Python Example"

    <div class="termy">
    ```console
    # >>>$ round(7/2)
    4
    ```
    </div>

### $\frac{3}{2}=\lfloor{1.5}\rceil\implies2$

???+ success "Python Example"

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

!!! attention

    Why python doesn't round to 5? :thinking:

### $\frac{5}{2}=\lfloor{2.5}\rceil\implies3$

<div class="termy">
```console
# >>>$ round(5/2)
2
```
</div>

!!! attention

    Why python doesn't round to 3? :thinking:

## Why? :thinking:

This Result was not expected, right? But everything has a reason :nerd:

This is because, in Python, the `round` function implements <a href="https://en.wikipedia.org/wiki/Rounding#Round_half_to_even" target="_blank">banker's rounding</a>, where all the half values are rounded to the closest even number. <a href="https://en.wikipedia.org/wiki/IEEE_754#Roundings_to_nearest" target="_blank">IEEE 754</a> recommends using this rounding.

!!! Info 

    Institute of Electrical and Electronics Engineers - (<a href="https://www.ieee.org/" target="_blank">IEEE</a>)

<h2><a href="https://docs.python.org/3/library/functions.html#round" target="_blank">Round Python Docs</a></h2>

!!! quote

    ## **round(number[, ndigits])**

    Return *number* rounded to *ndigits* precision after the decimal point. If *ndigits* is omitted or is `None`, it returns the nearest integer to its input.

    For the built-in types supporting round(), values are rounded to the closest multiple of 10 to the power minus *ndigits*; if two multiples are equally close, rounding is done toward the even choice (so, for example, both `round(0.5)` and `round(-0.5)` are `0`, and `round(1.5)` is `2`). Any integer value is valid for *ndigits* (positive, zero, or negative). The return value is an integer if *ndigits* is omitted or `None`. Otherwise, the return value has the same type as *number*.

    For a general Python object `number`, `round` delegates to `number.__round__`.

    !!! Note

        The behavior of `round()` for floats can be surprising: for example, `round(2.675, 2)` gives `2.67` instead of the expected `2.68`. This is not a bug: it’s a result of the fact that most decimal fractions can’t be represented exactly as a float. See <a href="https://docs.python.org/3/tutorial/floatingpoint.html#tut-fp-issues" target="_blank">Floating Point Arithmetic: Issues and Limitations</a> for more information.


After knowing this I'll never use the `round` in the same way again. :smile:


:book: Recommended reading: <a href="https://stackoverflow.com/questions/45223778/is-bankers-rounding-really-more-numerically-stable/45245802#45245802" target="_blank">Is bankers rounding really more numerically stable?</a>
