Class Webinar.SaveWithPostalCode Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Method AddPostalCode(pRequest As Webinar.RequestMsg, Output pResponse As Ens.Response) As %Status [ Language = python ]
Method AddPostalCode(pRequest As Webinar.RequestMsg, pResponse As Ens.Response) As %Status [ Language = python ]
{
  import iris
  from geopy.geocoders import Nominatim
  
  geolocator = Nominatim(user_agent="app")
  
  location = geolocator.geocode(pRequest.Address)
  
  data = location.raw
  
  loc_data = data['display_name'].split(',')

  zipcode = loc_data[-2]
  
  human = iris.cls("Webinar.Human")._New()
	  
  human.Name = pRequest.Name
  
  human.Address = pRequest.Address
  
  human.HebrewUpdateDate = pRequest.HebrewUpdateDate
  
  human.PostalCode = zipcode
  
  
  
  st = human._Save()
  
  return st
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Webinar.RequestMsg">
    <Method>AddPostalCode</Method>
  </MapItem>
</MapItems>
}

}
