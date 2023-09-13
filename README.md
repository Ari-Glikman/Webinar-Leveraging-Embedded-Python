# Webinar: Leveraging Embedded Python

These demos are to make it easier for you to follow along with the webinar. Additional resources are available as well, details at the end.

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

The TCP Service receives the HL7 message, and forwards it to the Buisness Process. Here it goes through a transformation, where the Name, Address, and Hebrew Update Date are put into the message and sent to the Buisness Operation. It in turn finds the postal code from the Python Library geopy, adds all fields from the message, and the postal code to the human, and saves the human into the table. We see the query results from the table using the SQL Tools InterSystems extension in Visual Studio code.

![image](https://github.com/Ari-Glikman/Webinar-Leveraging-Embedded-Python/assets/73805987/dde41ec2-6b87-4200-b862-ee4f7e4f4ce6)

![image](https://github.com/Ari-Glikman/Webinar-Leveraging-Embedded-Python/assets/73805987/9c9d9c6c-30b0-4fee-8bf7-cc6ddfbee4da)

![image](https://github.com/Ari-Glikman/Webinar-Leveraging-Embedded-Python/assets/73805987/c787b3e8-61cd-473e-aa82-b32551ead6b8)

![image](https://github.com/Ari-Glikman/Webinar-Leveraging-Embedded-Python/assets/73805987/a56c2bb6-ae22-46d9-a3b7-dad85588a132)



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

## Additional Resources

Want to learn more? Don't speak Hebrew? There are numerous resources available for you:
- [Intro to Embedded Python](https://community.intersystems.com/post/video-introduction-embedded-python)
- [Official Documentation](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=AFL_epython)
- [Using Python with InterSystems IRIS](https://community.intersystems.com/post/video-using-python-intersystems-iris)
- [Use Cases](https://community.intersystems.com/post/video-embedded-python-use-cases)
- [Bring It To Your App](https://community.intersystems.com/post/video-embedded-python-bring-python-ecosystem-your-objectscript-app)
- [Write Your SQL Stored Procedures In Python](https://community.intersystems.com/post/new-video-embedding-python-sql-write-your-stored-procedures-python)

  But that's not all. Check out our [InterSystems Community](https://community.intersystems.com/tags/embedded-python), (InterSystems Open Exchange)[https://openexchange.intersystems.com/?search=embedded%20python&sort=r], (Youtube Channel)[https://www.youtube.com/@InterSystemsCorp/search?query=embedded%20python] to find many more articles, videos, and information to help you advance your embedded python knowledge.
