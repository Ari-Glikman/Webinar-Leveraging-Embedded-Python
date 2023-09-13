# Webinar: Leveraging Embedded Python

## Change From ObjectScript Shell to Python Shell

```
WEBINAR> do ##class(%SYS.Python).Shell()
Python 3.9.5 (default, Jul 31 2023, 18:25:30) [MSC v.1927 64 bit (AMD64)] on win32
Type quit() or Ctrl-D to exit this shell.
>>> 
```

## Change Namespace within Python Shell
```
>>> do iris.execute('zn "USER"')
```

## Open An Object With Python Shell and Change a Value

```
>>> person = iris.cls('Webinar.Human')._OpenId(5)
>>> person.Name = "Golda Meir"
>>> st = person._Save()
>>> print(st)
1
>>>
```

## SQL Query From Python Shell
```
>>> stmnt = iris.sql.prepare("Select ID, Name, Address, PostalCode From Webinar.Human WHERE ID < ?")
>>> rs = stmnt.execute()
>>> for idx, row in enumerate(rs):
...     print(f"{row}")

...RESULTS HERE...

```

## Globals and Embedded Python
```
>>> myGref = iris.gref('^Days')
>>> myGref[None] = 7
>>> myGref[1] = 'Sunday'
>>> myGref[7] = 'Shabbat'
>>> print(myGref[7])
```

## Libraries

### Installing a Library, Importing and Using it via ObjectScript Shell: [geopy](https://pypi.org/project/geopy/) 

Powershell:
```
PS C:\InterSystems_Webinar\bin> .\irispip install --target C:\InterSystems_Webinar\mgr\python geopy
```

ObjectScript Shell:
```
WEBINAR> set geopy = ##class(%SYS.Python).Import("geopy.distance")
WEBINAR> set builtins = ##class(%SYS.Python).Builtins()
WEBINAR> set TelAviv = builtins.list()
WEBINAR> do TelAviv.append(32.0853)
WEBINAR> do TelAviv.append(34.7818)
WEBINAR> set Jerusalem = builtins.list()
WEBINAR> do Jerusalem.append(31.7683)
WEBINAR> do Jerusalem.append(35.2137)
WEBINAR> set route = geopy.distance(TelAviv, Jerusalem)
WEBINAR> write route.km
53.88684225580475839
```

### Installing a Library, Importing and Using it via Python Shell: [jsondiff](https://pypi.org/project/jsondiff/)

Powershell:
```
PS C:\InterSystems_Webinar\bin> .\irispip install --target C:\InterSystems_Webinar\mgr\python jsondiff
```

Python Shell:
```
>> from jsondiff import diff
>>> diff({'a': 1, 'b': 2}, {'a': 1, 'b':3})
{'b':3}
```

### Converting JSON to Excel: [json2excel](https://pypi.org/project/json2excel/)

Powershell:
```
PS C:\InterSystems_Webinar\bin> .\irispip install --target C:\InterSystems_Webinar\mgr\python json2excel
```

Python Shell:
```
>>> from json2excel import Json2Excel
>>> json2excel = Json2Excel()
>>> jsons = [{"studentNo":1001, "Name": "Rivka"},{"studentNo":1002, "Name":"Benny"}]
>>> print(json2excel.run(jsons))
<file location>
```

## Interoperability
![image](https://github.com/Ari-Glikman/Webinar-Leveraging-Embedded-Python/assets/73805987/dde41ec2-6b87-4200-b862-ee4f7e4f4ce6)


## Running a Python Script
```
PS C:\InterSystems_Webinar\bin> $env:IRISUSERNAME = "aglikman"
PS C:\InterSystems_Webinar\bin> $env:IRISPASSWORD = "1234"
PS C:\InterSystems_Webinar\bin> $env:IRISNAMESPACE = "WEBINAR"
PS C:\InterSystems_Webinar\bin> .\irispython C:\Users\aglikman\Documents\MyProjects\Webinar\test.py

Fibonacci series:
0 1 1 2 3 5 8 
Run IRIS Code:

Hi! I'm Issac Herzog.
I live at 3 HaNassi, Jerusalem.
My postal code is: 9218801.
```
