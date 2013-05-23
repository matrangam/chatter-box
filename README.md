# Chatter-Box Web Application

## Dependencies

* __[NodeJS](http://nodejs.org/)__: Executes javascript from the command line.
* __[Node Package Manager](http://nodejs.org/)__: Manages NodeJS libraries.
* __[Ruby](http://www.ruby-lang.org/en/)__: Necessary for various libraries that run the build process.
* __[Bundler](http://gembundler.com)__: Manages Ruby libraries.
* __[CoffeeScript](http://coffeescript.org/)__: A javascript abstraction language the lowers the barrier to complex object-oriented javascript programming.
* __[Jison](http://zaach.github.com/jison/)__: A javascript Bison implementation necessary to compile the parser for the Chatter-Box Rules Engine intermediary language.
* __[Codo](https://github.com/netzpirat/codo)__: Generates HTML documentation for CoffeeScript source code.

## Installation

To install dependencies necessary for building and/or developing Chatter-Box:

### OSX

1. __Install NodeJS__: Package located at `dependencies/node-v0.8.17.pkg`
2. __Install Ruby__: Package located at `dependencies/ruby-1.8.7-p358.tar.gz`
3. __Install Bundler__: `gem install dependencies/bundler-1.2.3.gem`
4. __Install Ruby Gems__: `bundle install --local`

### Windows

1. __Install NodeJS__: Installer located at `dependencies/node-v0.8.17-x64.exe`
2. __Install Ruby__: Installer located at `dependencies/rubyinstaller-1.8.7-p358.exe`
3. __Install Bundler__: `gem install dependencies/bundler-1.2.3.gem`
4. __Install Ruby Gems__: `bundle install --local`

## Building

### Building everything

```
bundle exec rake build
```

### Cleaning the build

```
bundle exec rake build:clean
```

### Generating Documentation

```
bundle exec rake docs
```

Note: If you experience an `EMFILE` exception when building documentation, you will need to increase the number of file descriptors available to the node process.

#### On OSX

```
ulimit -n <limit>
```

## Developing

### Starting Guard

```
bundle exec guard
```
