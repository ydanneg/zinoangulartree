angular.module('angTree').controller 'TreeController', ($scope, TreeItem, $mdDialog) ->

  makeNewTree = ->
    new TreeItem('Item')

  parseToTreeItem = (obj) ->
    obj.__proto__ = TreeItem.prototype
    obj.getItems().forEach (entry) ->
      parseToTreeItem entry
      entry.setParent obj
      return
    obj

  replacer = (key, value) ->
    if key == 'parent'
      undefined
    else
      value

  $scope.saveTree = ->
    localStorage.setItem 'TreeObject', JSON.stringify($scope.tree, replacer)
    return

  $scope.tree = if localStorage and localStorage.getItem('TreeObject') then parseToTreeItem(JSON.parse(localStorage.getItem('TreeObject'))) else makeNewTree(name)
  return