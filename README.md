# shiny.blueprint

A simple, but non-trivial example R web application based on shiny

* Different endpoints by a routing layer using [shiny.router](https://github.com/Appsilon/shiny.router)
* A database layer (In this example PostgreSQL, but you can easily switch to another system)
* A naive authentication system

[See it in action here!](shiny-blueprint-demo.herokuapp.com)

### What is the purpose of this repo?

I want to find good way of out how a grown shiny web application could be structured to be maintainable and extendable. So this repo is my personal "state-of-the-art-sample-app" on how I'd organize a shiny app that has multiple endpoints and a database connection. 

Each HTTP endpoint has a server-side callback function that I call `action`. Each action is the data source for a rendering function, that is called a `ui` function. The router maps each request to the proper pair  `(action, ui)` that serves the response then.

Do you have any suggestions or improvement thoughts? Let's talk and discuss: Feel free to open an issue or contact me [via twitter 🐦](https://www.twitter.com/funktoriell)

### How to run app on your machine

First, edit the information you find in `.Renviron.example`, i.e. choose
a password, i.e. 12345, and store the new file as `.Renviron`, which will be git-ignored.

Then, run this command:

```shell
./run_local.sh
```
… and visit `localhost:3333` in your browser.

### Deployment (i.e. with heroku)

Create a heroku app and add it as git remote `heroku`. Use the default heroku stack `heroku-16`
and use the proper buildpack for your app by

```shell
heroku buildpacks:add http://github.com/virtualstaticvoid/heroku-buildpack-r.git#heroku-16
```

Afterwards `git push heroku master` is your friend!


### How does it look like?

![screenshot](https://user-images.githubusercontent.com/3685123/39448039-f7a12cf4-4cc3-11e8-9de7-93ef1f23d91c.png)
