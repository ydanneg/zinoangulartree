'use strict'
describe 'TreeItemSpec', ->
  scope = undefined #we'll use this scope in our tests
  
  #mock Application to allow us to inject our own dependencies
  beforeEach angular.mock.module('angTree')
  
  # TreeItem model test suite
  describe 'TreeItem Suite', ->
    rootItemName = 'RootItem'
    TreeItem = undefined
    
    # setup
    beforeEach inject((_TreeItem_) ->
      TreeItem = _TreeItem_
    )
    
    # TreeItem model basic test suite
    describe 'TreeItem model basic test-suite', ->
      it 'constructor', ->
        item = new TreeItem(rootItemName)
        expect(item.getName()).toBe(rootItemName)
        expect(item.getItems().length).toBe(0)
        expect(item.getLevel()).toBe(0)
        expect(item.getParent()).toBe(null)

      it 'setParent', ->
        item = new TreeItem(rootItemName)
        expect(item.getParent()).toBe(null)
        parent = new TreeItem('parent')
        item.setParent(parent)
        expect(item.getParent()).toBe(parent)

      it 'setLevel', ->
        item = new TreeItem(rootItemName)
        expect(item.getLevel()).toBe(0)
        item.setLevel(100)
        expect(item.getLevel()).toBe(100)

      it 'addItem', ->
        item = new TreeItem(rootItemName)
        item.addItem new TreeItem('child')
        expect(item.getItems().length).toBe(1)
        expect(item.getItems()[0].getLevel()).toBe(1)
        expect(item.getItems()[0].getParent()).toBe(item)

      it 'getItems', ->
        item = new TreeItem(rootItemName)
        item.addItem new TreeItem('child')
        expect(item.getItems().length).toBe(1)

      it 'getItems should be immutable', ->
        item = new TreeItem(rootItemName)
        item.addItem new TreeItem('child')
        expect(item.getItems().length).toBe(1)
        
        # trying to modify item array
        item.getItems().push new TreeItem('child1')
        
        # original array should not be modified
        expect(item.getItems().length).toBe(1)

      it 'removeItem', ->
        item = new TreeItem(rootItemName)
        child = new TreeItem('child')
        item.addItem(child)
        item.removeItem(child)
        expect(item.getItems().length).toBe(0)

      it 'remove', ->
        item = new TreeItem(rootItemName)
        child = new TreeItem('child')
        item.addItem(child)
        child.remove()
        expect(item.getItems().length).toBe(0)

      it 'setName', ->
        item = new TreeItem(rootItemName)
        item.setName('newName')
        expect(item.getName()).toBe('newName')