angular.module('angTree', [
  'ngRoute'
  'ngMaterial'
])
angular.module('angTree').config ($routeProvider, $rootScopeProvider) ->
  $rootScopeProvider.digestTtl 100 # Defines possible depth of the tree
  $routeProvider.when '/',
    templateUrl: 'tree/tree.html'
    controller: 'TreeController'