{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'quickhyperlink:convert': => @convert()

  deactivate: ->
    @subscriptions.dispose()

  convert: ->
    editor = atom.workspace.getActiveTextEditor()
    selection = editor.getSelectedText()
    clipboardText = atom.clipboard.read()
    editor.insertText('<a href=\"'+clipboardText+'\">'+selection+'</a>')
