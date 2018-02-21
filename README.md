# Blog

[![Build Status](https://travis-ci.org/IT-lift/IT-lift.github.io.svg)](https://travis-ci.org/IT-lift/IT-lift.github.io)

We use [jekyll](https://jekyllrb.com) static site generator which supports [github pages](https://pages.github.com/). So this blog is hosted on github.

## How to make a new post

Create a file in the `_posts` folder with the name in the form of `YEAR-MONTH-DAY-post_name`. The post name will be a url to this post, so date will be cut and is used only for ordering.

To attach files and images, you can put them in the `assets` folder. 

When you push to the `master` branch, github automagically compile this blog and update data. It may consume 5 minutes.

## How setup environment (docker)

You need to have docker been installed on you machine. Also we use `make` to simplify commands.

- `make` - run server
- `make test` - test blog, links, styles
- `make build` - build blog. Actually you do not need this.
- `make update` - update gems.
- `make down` - destoy docker container.

---

## How setup environment (Full guide)

You need a ruby installed on your computer - [Download ruby](https://www.ruby-lang.org/en/downloads/). On linux, osx you can do it via package manager, but i recommend to use [RVM](https://rvm.io/).

Install [bundler](http://bundler.io/): `gem install bundler`.

Now go to the project location and run `bundle install` to setup requirements.

## Hot to run it locally

Just run `bundle exec jekyll server` from the command line in the project root. It will start a server with livereload.

See result here [localhost:3000](http://localhost:3000).

## How to customize

In the jekyll usually create a theme and customize it. In our case we do not use themes but have our own styles, layouts and so on.

In the `assets` are styles, scripts, images, files. Actually you could use sass and even coffeescript.

In the `_layouts` are layouts - it's "bacground" pages. In the `_posts` you can specify which layout to use for each post.

In the `_includes` are partials. For example, header, footer, discuss block and so on.

In the `_config.yml` you can put some variables, for example email, social network links, domain name and so on.
