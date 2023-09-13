Class Webinar.Luach Extends Ens.Rule.FunctionSet
{

ClassMethod HebrewDate(date As %DateTime) As %String [ CodeMode = expression, Final ]
{
..CheckJewishCal(date - $H)
}

ClassMethod CheckJewishCal(daysFromToday As %Integer) As %String [ Language = python ]
{
	
	from pyluach import dates, hebrewcal, parshios
	
	today = dates.HebrewDate.today() + daysFromToday
	
	return today.hebrew_date_string()
}

}
