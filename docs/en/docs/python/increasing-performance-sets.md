# ⚡️ Increasing the performance of sets

There are basically two ways to declare sets in python:

```py title="First Option"
first_option = {1, 2}
```

```py title="Second Option"
second_option = set([1, 2])
```

!!! Info 

    This aproach calls the constructor of sets


## 🤔 But what is the difference between them?


Let's see what python does under the hood using <a href="https://guedesfelipe.github.io/blog/python/disassembler/" target="_blank">disassembler</a>. :nerd:

## Let's see the byte code of the first option
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

Here we can see that whoever does almost all the work is the special *byte_code* called `BUILD_SET` and soon after it returns the set to us. Very simple, right?

## Let's see the byte code of the second option
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

Notice that it does a lot of things that the first one doesn't, this makes this approach slower when loading sets in python, because instead of `BUILD_SET` it needs to do 3 more steps, which are `LOAD_NAME`, `BUILD_LIST` and `CALL_FUNCTION`. This way is slower because the python interpreter needs to look up the set name to find the constructor, then build a list and finally pass it to the constructor.

You can find the description of all byte codes <a href="https://docs.python.org/3/library/dis.html#python-bytecode-instructions" target="_blank">here</a>.


## 📈 Benchmark

In the table below, we can see the difference between the two way, and which one is more optimized:

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




## Conclusion

So if one day you need to instantiate a set, always try to use the first option, because it is more optimized. And an extra tip: In case you need to instantiate an empty set, we can only do that by calling the constructor, okay?!

Leave your comment below about the post, see you next time! 😃
