# PrimeRails

PrimeRails is a spin-off from the popular JavaServer Faces Component Suite, PrimeFaces. PrimeRails is a collection of rich javascript widgets based on PrimeUI.

![Rails Logo](http://primerails.herokuapp.com/images/rails.png)

Installation
------------
Add these to your Gemfile:

```
gem 'jquery-rails' #it's probably in your Gemfile already.
gem 'prime-rails'
```

Then ``bundle install`` to install the gems.

Then add assests to your layout:

```
<%= stylesheet_link_tag "aristo/theme" %> #check examples for appropriate themes.
<%= stylesheet_link_tag "prime-ui" %>

<%= javascript_include_tag "prime-ui" %>
```
Examples
--------
Checkout [PrimeRails](http://primerails.herokuapp.com).

TODO
----
* TESTS (Urgent)
* Separate gem for Themes (Support two by default, perhaps bootstrap and foundation)

Contributing
-------------
Please checkout CONTRIBUTING.md for details.

License
-------
PrimeRails is Copyright © 2013 Lazario Nixon. It is free software, and may be redistributed under the terms specified in the LICENSE file.




