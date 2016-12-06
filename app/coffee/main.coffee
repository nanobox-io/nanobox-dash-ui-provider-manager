ProviderList = require 'provider-list'
ProviderEdit = require 'provider-edit'

class ProviderAccounts

  constructor: (@$el, @data) ->
    @accountList = new ProviderList @$el, @data.accounts, @showAccount

  showAccount : (providerId) =>
    @accountList.hide()
    @account = new ProviderEdit @$el, @getAccountData(providerId), @data.endpointTester, @data.verifyAccount, @data.updateProvider, @hideAccount

  hideAccount : () =>
    @account.destroy()
    @account = null
    @accountList.show()

  getAccountData : (id) ->
    for account in @data.accounts
      if id == account.id
        return account



window.nanobox ||= {}
nanobox.ProviderAccounts = ProviderAccounts