

module.exports = function (grunt) {
    'use strict';

    grunt.initConfig({
        lint: {
            all: ['grunt.js', 'tasks/*.js']
        },
        jshint: {
            options: {
                curly: true,
                eqeqeq: true,
                immed: true,
                latedef: true,
                newcap: true,
                noarg: true,
                sub: true,
                undef: true,
                boss: true,
                eqnull: true,
                node: true,
                es5: true
            },
            globals: {}
        },
        cucumberjs: {
            executable: "/Users/huangr/git_repos/shall_we_test/node_modules/.bin/cucumber.js", /* Relative to /tasks folder */
            features: "../tests/cucumber/features",
            steps: "../tests/cucumber/features/steps"
        }
    });


grunt.loadNpmTasks('grunt-cucumber');

grunt.registerTask('default', 'cucumberjs');
    //grunt.loadTasks("tasks");

    //grunt.registerTask('default', 'cucumberjs');

};