Class Webinar.RequestMsg Extends (%Persistent, Ens.Request)
{

Property Name As %String;

Property Address As %String;

Property PostalCode As %String;

Property HebrewUpdateDate As %String;

Storage Default
{
<Data name="RequestMsgDefaultData">
<Subscript>"RequestMsg"</Subscript>
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>Address</Value>
</Value>
<Value name="3">
<Value>PostalCode</Value>
</Value>
<Value name="4">
<Value>IsJewishHoliday</Value>
</Value>
<Value name="5">
<Value>HebDate</Value>
</Value>
<Value name="6">
<Value>HebrewDate</Value>
</Value>
<Value name="7">
<Value>HebrewUpdateDate</Value>
</Value>
</Data>
<DefaultData>RequestMsgDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
