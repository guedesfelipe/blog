import requests # (1)


try:
    response = requests.get('https://api.aakhilv.me/fun/facts') # (2)
    response.raise_for_status() # (3)
    fun_fact = response.json()[0] # (4)
    print(f'Fun Fact: {fun_fact}') # (5)
except HTTPError as error: # (6)
    print(f'[{error.response.status_code}] {error}') # (7)
