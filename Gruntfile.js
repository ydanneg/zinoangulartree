'use strict';

module.exports = function(grunt) {

// Project configuration.
    grunt.initConfig({
        concat: {
            dist: {
                src: [
                    'app/app.js',
                    'app/tree/tree.j',
                    'app/tree/tree-item/tree-item.js',
                    'app/tree/tree-object.js'
                ],
                dest: 'build/tree.js'
            }
        },
        uglify: {
            options: {
                mangle: {
                    except: ['jQuery', 'Backbone']
                }
            },
            my_target: {
                files: {
                    'build/tree.min.js': ['build/tree.js']
                }
            }
        }
    });


    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');

    grunt.registerTask('default', ['concat']);
};