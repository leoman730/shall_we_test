module.exports = function () {
    this.World = require('../support/world.js').World;

	this.Given(/^I am on (.*)$/, function(path, callback) {
		this.spooky.thenOpen(path);
		callback();
	});

	this.Then(/^I should see a title '(.*)'$/, function(pagetitle, callback) {
		this.spooky.then([{title: pagetitle}, function() {
			this.test.assertTitle(title, 'Test title');
	}]);

		callback();
	});
};