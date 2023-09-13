Class Webinar.Human Extends (%Persistent, %Library.Populate) [ DdlAllowed ]
{

Property Name As %String;

Property Address As %String(POPSPEC = "Street()");

Property PostalCode As %String;

Property HebrewUpdateDate As %String;

Method PythonPrint() As %Status [ Language = python ]
{
    print(f"Hi! I'm {self.Name}.\nI live at {self.Address}.\nMy postal code is:{self.PostalCode}.")
}

Storage Default
{
<Data name="HumanDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Address</Value>
</Value>
<Value name="4">
<Value>PostalCode</Value>
</Value>
<Value name="5">
<Value>HebrewUpdateDate</Value>
</Value>
</Data>
<DataLocation>^Webinar.HumanD</DataLocation>
<DefaultData>HumanDefaultData</DefaultData>
<IdLocation>^Webinar.HumanD</IdLocation>
<IndexLocation>^Webinar.HumanI</IndexLocation>
<StreamLocation>^Webinar.HumanS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
