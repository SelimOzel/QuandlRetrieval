// Standard io library
import std.stdio;

// Handles URL requests
import std.net.curl;

// JSON parser
import std.json;

// File read/write
import std.file;

void main()
{
	writeln("Quandl Data Retrieval");

	// Inputs
	string tickerName 	= "SPY";
	string startDate 	= "2020-03-1";
	string endDate 		= "2020-03-17";
	string apiKey 		= "";

	// Query
	string dataQuery = "https://www.quandl.com/api/v3/datasets/EOD/" ~ tickerName ~ "?start_date=" ~ startDate ~ "&end_date=" ~ endDate ~ "&api_key=" ~ apiKey;
	auto content = get(dataQuery);

	// Parse retrieved data
	JSONValue j = parseJSON(content);

	// Write to file
	std.file.write(tickerName~"_"~startDate~"_"~endDate~".json", j.toPrettyString);
}
