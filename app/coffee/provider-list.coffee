providerList = require 'jade/provider-list'

module.exports = class ProviderList

  constructor: ($el, accounts, onEditProviderCb) ->
    @$node = $ providerList( {accounts:accounts} )
    $el.append @$node
    castShadows()

    # Edit provider button click
    $(".button").on 'click', (e)->
      onEditProviderCb e.currentTarget.getAttribute('data-id')

  hide : () -> @$node.css display:"none"
  show : () -> @$node.css display:"initial"
