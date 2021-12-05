# Developer Log

## 4th December

* Created repo
* [Tutorial used](https://github.com/johncorderox/Rails-API-React-Tutorial)
* Controllers routes are specified as api/v1/subjects


## 6th December

* Abandoning react router, it's difficult to pass data from the controllers to react views when Rails isnt handling routing
* Set up the empty component files
* Subject data seeded into the database and the index page renders the 'app' component and the 'app' component renders these subjects
* Abandoned Devise for authorisation it's difficult to use with Rails API
* Looking into JSON web token (JWT) for auth