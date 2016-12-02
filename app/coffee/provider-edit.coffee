providerEdit = require 'jade/provider-edit'

module.exports = class Provider

  constructor: ($el, providerData, onSave, onCancel) ->
    @$node = $ providerEdit( providerData )
    $el.append @$node
    $("#cancel", @$node).on 'click', onCancel
    $("#save", @$node).on 'click', ()->
      console.log 'hi'
    castShadows(@$node)

  destroy : ()->
    $("#cancel", @$node).off()
    $("#save", @$node).off()
    @$node.remove()
