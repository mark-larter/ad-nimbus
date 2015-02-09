// Dependencies.
var express = require('express');
var geoReader = require('maxmind-db-reader');

// Constants.
var SERVICE = "netLocation";
var PORT = 8080;

// Initialize MaxMind geo-location data.
var countryDb = geoReader.openSync(__dirname + '/data/maxMind/GeoIP2-City.mmdb');
var ispDb = geoReader.openSync(__dirname + '/data/maxMind/GeoIP2-ISP.mmdb');

// Create service.
var app = express();

// Define routes.
app.get('/', function(request, response) {
    // Get IP address for lookup. First check query params, use request IP if
    // query param not specified.
    var ipAddress = request.query.ipAddress;
    console.log('ipAddress: ' + ipAddress);
    if (!ipAddress) ipAddress = request.ip;
    console.log('ipAddress: ' + ipAddress);
        
    // Lookup geo-location for specified IP.
    countryDb.getGeoData(ipAddress, function(err, geoData) {
        // Do something about err.
        if (err) {
        }
        
        // Respond with data.
        response.send(geoData);
        console.log(geoData);
    });
});

// Listen.
app.listen(PORT);
console.log(SERVICE + ' running on port ' + PORT);
