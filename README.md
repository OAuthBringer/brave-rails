# Requirements

Everything here has been containerized for conveninience, but you will need functional version of Docker and Docker Compose running locally

Assuming OSX and Homebrew:
  https://docs.docker.com/desktop/mac/install/
 
Docker compose is built in python so you'll need to install it through whatever your preferred mechanism is:

`pip3 install docker-compose`

# Usage

To spin it up:

`docker-compose build`
`docker-compose run`

The API will be available at http://localhost:3000. The root path is a simple healtcheck that should return a success json object.

To tear everything down:

`docker-compose down`

# Implementation

This rails backend is truly just a thin caching proxy for SWAPI API.  It implements no models and doesn't even utilize a database.  It has one controller method that mediates all SWAPI API interactions through a few simple services.

At core all this endpoint does is accept a single parameter "url" and then it checks to see if this data has been cached, if so it returns the cached data and performs an async refresh task.  If the data hasn't been cached it executes a synchronous HTTP request and then caches the result.

## Strengths

Stupid simple, performant, solves all cases for SWAPI proxy in a single endpoint.

## Weaknesses

Data isn't SQL queryable, data is just string blobs stored in cache. If we aren't using an LRU cache over time you have the potential to cache the entirety of the SWAPI API in memory which is probably not viable.

## Possible Improvements

1. Cache warming - Implement a cache warming system.  Initial requests are still bound by HTTP network latency.
1. Relational data handling.  The major issue with this implementation from a UI perspective is that there are now human friendly references for the associated URLs on any given resource meaning that the only display value we can show on the front-end has to be derived from the URL itself.  This is a weakness in SWAPI's API itself and would require either actual database modeling to resolve or some very clever cache-fu.
1. Pagination/Search Support.  This can be done natively.  It's just a matter of handling query params etc.

## Conclusion

These two issues aside, this backend supports navigation of every aspect of the SWAPI API dynamically with a single endpoint and adds caching performance that dramatically improves UX as usage increases.


