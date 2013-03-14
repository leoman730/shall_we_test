# Shall We Test [![Build Status](https://travis-ci.org/leoman730/shall_we_test.png)](https://travis-ci.org/leoman730/shall_we_test)


This project will set up a basic working template for testing environment. It basically pulling ideas from many other resources together to make test easier.

After setup completed, we should have a working test environment that enable test using: cucumberjs, casperjs, mochajs.

As mentions above, this project basically pulling ideas from the resources that found on the web. Special thanks from the following resources:

1. http://casperjs.org/index.html

2. http://matthewcarriere.com/2012/12/31/how-to-setup-mocha-and-spookyjs-for-node-js/

3. http://jspro.com/toolsandlibraries/headless-webkit-and-phantomjs/

4. https://github.com/WaterfallEngineering/SpookyJS

## Environement:
I am running on the following environment:
* Mac OS 10.8.2
* brew 0.9.4
* casper 1.0.1
* phantomjs 1.8.1


## Rerequisites:
```
// Install Casperjs: 
$ brew install casperjs

// Install Phantomjs 
$ brew install phantomjs

```


To use coloring option in cucumber, you will need to optionally download the color branch 
in cucumberjs

```
git clone git://github.com/cucumber/cucumber-js.git -b colors
```
