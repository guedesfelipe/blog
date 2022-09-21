# Increasing the performance of sets

There are basically two ways to declare sets in python:

```py title="First Option"
first_option = {1, 2}
```

```py title="Second Option"
second_option = set([1, 2])
```

!!! Info 

    This aproach calls the constructor of sets


## But what is the difference between them?


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

Here we can see that whoever does almost all the work is the special *byte_code* called `BUILD_SET` and soon after it returns the set to us, very simple right.

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

Notice that it does a lot of things that the first one doesn't, this makes this approach slower when loading sets in python, because instead of `BUILD_SET` it needs to do 3 more steps, which are `LOAD_NAME`, `BUILD_LIST` and `CALL_FUNCTION`. This way is slower because the python interpreter needs to look up the set name to fund the constructor, then build a list and finally pass it to the constructor.

## Benchmark

| Set Size   |  Factor | Constructor Time | Factor | Without Constructor Time | Factor |
| :--------: | :-----: | :--------------: | :----: | :----------------------: | :----: |
|    1.000   |    1x   |                  |        |                          |        |
|   10.000   |   10x   |                  |        |                          |        |
|   100.000  |   100x  |                  |        |                          |        |
|  1.000.000 |  1.000x |                  |        |                          |        |
| 10.000.000 | 10.000x |                  |        |                          |        |

## Conclusion

So if one day you need to instantiate a set, always try to prefer the creation of the first way, beacause it is more optimized. And an extra tip: In case you need to instantiate an empty set, we can only do that by calling the constructor okay?!
