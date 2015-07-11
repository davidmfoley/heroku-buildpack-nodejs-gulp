Heroku Buildpack for Node.js, gulp.js, and bower
========================================

About
-----
based on [heroku-buildpack-nodejs-gulp-bower] (https://github.com/davidmfoley/heroku-buildpack-nodejs-gulp-bower).
just updated to the latest [heroku-buildpack-nodejs](https://github.com/heroku/heroku-buildpack-nodejs).  v76
which supports bower_components caching

Usage
-----

- Set your Heroku app's buildpack URL to `https://github.com/dh94/heroku-buildpack-nodejs-gulp-bower.git`. To be safe, you should really fork this and use your fork's URL.
- Run `heroku config:set NODE_ENV=production` to set your environment to `production` (or any other name)
- Add a Gulp task called `heroku:production` that builds your app

- Add a single line `Procfile` to the root to serve the app via node:

```
web: node index.js
```

(edit to fit your case)

Credits
-------
Forked from [heroku-buildpack-nodejs-gulp-bower] (https://github.com/davidmfoley/heroku-buildpack-nodejs-gulp-bower).

Which was Forked from [heroku-buildpack-nodejs-gulp](https://github.com/timdp/heroku-buildpack-nodejs-gulp).

Which was forked from [heroku-buildpack-nodejs](https://github.com/heroku/heroku-buildpack-nodejs).

Heavily based on [heroku-buildpack-nodejs-grunt](https://github.com/mbuchetics/heroku-buildpack-nodejs-grunt).