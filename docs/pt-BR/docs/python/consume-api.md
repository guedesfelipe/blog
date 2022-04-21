# 👽️ Como consumir uma API com Python

Para consumir uma API de forma simples com Python usaremos a biblioteca chamada [requests](https://docs.python-requests.org/en/latest/).

## 🔧 Preparando o Ambiente


=== "Virtual Env"

    ```bash

    python3 -m venv .venv # (1)
    source .venv/bin/activate # (2)
    pip install requests # (3)

    ```

    1. Criando a virtualenv (:warning: Mude `python3` para o PATH onde esta instalado o seu Python se for necessário)
    2. Ativando a virtualenv (MacOS e Linux)
    3. Instalando a biblioteca [requests](https://docs.python-requests.org/en/latest/user/install/#installation-of-requests)

=== "Poetry"

    ```bash

    poetry install requests # (1)

    ```

    1. Instalando a biblioteca [requests](https://docs.python-requests.org/en/latest/user/install/#installation-of-requests) with [Poetry](https://python-poetry.org/)


## ⌨️ Código

  Neste exemple vamos consumir a [API](https://api.aakhilv.me) que retornará um fato divertido aleatório e mostrar em tela.


```python linenums="1" title="consume_api.py"
--8<-- "consume_api.py"
```

1. Importando a biblioteca requests
2. Realizando o get no enpoint `/fun/facts` na API
3. Checando se a requisição retornou algum erro de [status_code](https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status), caso de erro irá gerar uma exceção do tipo `HTTPError` (Linha **9** trata esta exceção)
4. Converte o response para json e pega o primeiro elemento da lista de retorno
5. Mostra em tela um fato divertido aleatório
6. Se a linha **6** levantar uma exceção do tipo `HTTPError`, aqui ela será tratada
7. Mostra em tela o status_code e o erro ocorrido


## 🚀 Rodando a Aplicação

  ```bash
  python consume_api.py
  ```

## 🖼️ Saída
![text](../imgs/consume_api.png)
