# Location By IP Address

## About

_Location By IP Address_ is an API designed to return location information based on IPv4 addresses.  The deployed site's endpoint can be consumed at:

http://location-by-ip-address.herokuapp.com/api/v1/locationByIp

## Endpoint

### GET /api/v1/locationByIp

Accepts a single query parameter, `ip`.  IP address must be formatted according to IPv4 specs.  Returns location data pertaining to the IP address specified.

Example of request:
`http://location-by-ip-address.herokuapp.com/api/v1/locationByIp?ip=73.14.137.32`

Example of expected output:
```
{
  Country: {
    ID: "332178",
    LocalizedName: "United States"
  },
  latitude: 39.613,
  longitude: -105.017,
  IsDaylightSaving: true,
  processingCode: "United States - Colorado - Littleton"
}
```

Returns a `400` error if no IP address is specified, or if the IP address is not formatted according to IPv4 specs.

## Local Installation

### Requirements
* [Ruby 2.4.1](https://www.ruby-lang.org/en/downloads/) - Ruby Version
* [Rails 5.2.0](https://rubyonrails.org/) - Rails Version

### Clone
```
$ git clone https://github.com/alexander-mathieu/location_by_ip_address.git
$ cd location_by_ip_address
```

### Setup Database
```
$ rake db:{create,migrate}
```

### Setup Environment Variables
* Run `$ bundle exec figaro install`
* Within `./config/application.yml`, define `ACCUWEATHER_API_KEY: <your key here>`
* Additional information on obtaining an API key can be viewed [here](https://developer.accuweather.com/)

### API Exploration

Once installation and database setup are complete:
* From the `location_by_ip_address` project directory, boot up a server with `$ rails s`
* Open your browser, and visit `http://localhost:3000/api/v1/locationByIp?ip=<insert IPv4 formatted IP address>`

### Running Tests

The full test suite can be run with `$ bundle exec rspec`.

Example of expected output:
```
....

Finished in 0.37847 seconds (files took 2.9 seconds to load)
4 examples, 0 failures

Coverage report generated for RSpec to /Users/alexandermathieu/turing/mod_5/code_challenges/location_by_ip_address/coverage. 93 / 93 LOC (100.0%) covered.
```