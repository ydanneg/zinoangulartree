angular.module('angTree').factory 'TreeItem', ->
  TreeItem = (name) ->
    @name = name
    @items = []
    @level = 0
    @parent = null

  TreeItem::addItem = (item) ->
    item.setLevel @level + 1
    item.setParent this
    @items.push item
    item

  TreeItem::setName = (@name) ->
#    @name = name

  TreeItem::setLevel = (@level) ->
#    @level = level

  TreeItem::getItems =  ->
    angular.extend([], @items)

  TreeItem::setParent = (@parent) ->
#    @parent = parent

  TreeItem::getParent = ->
    @parent

  TreeItem::getName = ->
    @name

  TreeItem::getLevel = ->
    @level

  TreeItem::removeItem = (item) ->
    _.remove @items, item

  TreeItem::remove = ->
    @parent.removeItem(this)

  TreeItem