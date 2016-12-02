ProviderList = require 'provider-list'
ProviderEdit = require 'provider-edit'

class Providers

  constructor: (@$el, @data) ->
    @providerList = new ProviderList @$el, @data.providers, @showProvider

  showProvider : (providerId) =>
    @providerList.hide()
    @provider = new ProviderEdit @$el, @getProviderData(providerId), @saveProvider, @hideProvider

  saveProvider : (data) ->
    console.log "saving:"
    console.log data

  hideProvider : () =>
    @provider.destroy()
    @provider = null
    @providerList.show()

  getProviderData : (id) ->
    for provider in @data.providers
      if id == provider.id
        return provider



window.nanobox ||= {}
nanobox.Providers = Providers
