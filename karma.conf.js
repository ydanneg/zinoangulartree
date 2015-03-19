module.exports = function(config){
  config.set({

    basePath : './',

    files : [
      'app/lib/angular/*.js',
      'app/lib/angular-mocks/*.js',
      'app/lib/jquery/*.js',
      'app/lib/**/*.js',
      'app/*.js',
      'app/**/*.js',
      'tests/*.js'
    ],

    autoWatch : true,

    frameworks: ['jasmine'],

    browsers : ['Chrome'],

    plugins : [
            'karma-chrome-launcher',
            'karma-firefox-launcher',
            'karma-jasmine',
            'karma-junit-reporter'
            ],

    junitReporter : {
      outputFile: 'test_out/unit.xml',
      suite: 'unit'
    }

  });
};
