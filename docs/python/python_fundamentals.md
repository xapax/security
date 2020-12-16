# Python fundamentals

## Array/list

```python
my_list = [1,"string",3,4,5]
for item in my_list:
    print item

# Append/push to list
my_list.append("addMe")
```


## Modules

Always good to modular your code.

**module1.py**

```python

def addNumbers(numberOne, numberTwo):
    return numberOne + numberTwo
```

**script.py**

```python
import module1

total = module1.addNumbers(1,2)
print total
```


## Pip - package management

Pip is the python package manager. It ca be used to download other modules.

Install pip

```bash
sudo apt-get install python-pip
```


To install package

```bash
pip install package
```