module.exports = function(grunt) {

  grunt.initConfig({
    lint: {
      all: ['tests/cucumber/features/steps/*.js']
    }
  });

  grunt.registerTask('default', 'lint');
  grunt.registerTask('travis', 'lint');

};