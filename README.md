Node.js + Sails.js Docker container
===================

Components
-------------
 * Debian Jessie
 * Node.js
 * Sails.js, grunt, bower, mocha, CoffeScript, compass

Usage:
-------------
 * Pull container
 ``docker pull leosuncin/node-sails``
 * install dependencies locally
 ``npm install && bower install``
 * Run container as an application
 ``docker run -it -p 1337:1337 -v $(pwd):/srv/sails leosuncin/node-sails lift --verbose``
