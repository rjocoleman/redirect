# Redirection
This is a very simple Ruby/Rack application to do 302 redirects based on the request's subdomains.

e.g. if this application is running on `example.com` then requesting `www.google.com.example.com` will redirect to `www.google.com`.

Query string, scheme and port of the original request are untouched.

## Configuration

The only configuration required is a single ENV variable so that the app know where it's running:

* `CURRENT_DOMAIN=`

Wildcard DNS should also be set up for your current domain e.g. `*.example.com`
