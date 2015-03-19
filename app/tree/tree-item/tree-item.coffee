DialogController = ($scope, $mdDialog, name) ->
  $scope.item_name = name
  $scope.answer = -> $mdDialog.hide($scope.item_name)

angular.module('angTree').directive 'treeItemWidget', ($compile, TreeItem, $mdDialog) ->
  restrict: 'E'
  replace: true
  scope:
    item: '='
    treeChanged: '&'

  templateUrl: 'tree/tree-item/tree-item.html'

  controller: ($scope, $log) ->
    $scope.delete = (ev) ->
      $mdDialog.show($mdDialog.confirm()
        .title('Would you like to delete this item children?')
        .ok('Yes')
        .cancel('Cancel')
        .targetEvent(ev)
      ).then ->
        $scope.item.remove()
        $scope.treeChanged()

    $scope.edit = (ev) ->
      $mdDialog.show(
        controller: DialogController
        templateUrl: 'tree/tree-item/dialog-tmpl.html'
        targetEvent: ev
        locals: name: $scope.item.getName()).then (name) ->
          $scope.item.setName(name)
          $scope.treeChanged()

    $scope.add = (ev) ->
      post = $scope.item.getItems().length + 1
      newName = 'Item ' + $scope.item.getLevel() + '.' + post
      $scope.item.addItem(new TreeItem(newName))
      $scope.treeChanged()

  link: (scope, element, attrs, ctrl) ->
    if angular.isArray(scope.item.getItems())
      content = $compile('<tree-item-widget ng-repeat=\'item in item.getItems() track by $index\' item=\'item\' tree-changed=\'treeChanged()\'></tree-item-widget>')(scope)
      element.append(content)