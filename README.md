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

### Installing a Library, Importing and Using it via ObjectScript Shell [geopy](https://pypi.org/project/geopy/) 

Powershell:
```
> .\irispip install --target C:\InterSystems_Webinar\mgr\python geopy
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




