'use strict'

describe 'Tree', ->
  scope = undefined #we'll use this scope in our tests
  
  #mock Application to allow us to inject our own dependencies
  beforeEach angular.mock.module('angTree')
  
  # Tree controller test suite
  describe 'TreeController', ->
    beforeEach angular.mock.inject(($rootScope, $controller) ->
      scope = $rootScope.$new()
      $controller 'TreeController', $scope: scope

    )
    it 'tree object should be initialized', ->
      expect(scope.tree).toBeDefined()