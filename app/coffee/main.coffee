ProviderList = require 'provider-list'
ProviderEdit = require 'provider-edit'

class ProviderAccounts

  constructor: (@$el, @data) ->
    @accountList = new ProviderList @$el, @data.accounts, @showAccount, @data.addProviderClick

  showAccount : (providerId) =>
    @accountList.hide()
    @account = new ProviderEdit @$el, @getAccountData(providerId), @data.endpointTester, @data.verifyAccount, @data.updateProvider, @data.deleteAccount, @hideAccount

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
