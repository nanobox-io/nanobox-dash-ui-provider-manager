ProvidersShim = require './shim/providers'

shim = new ProvidersShim()

# ------------------------------------ Simulate rails methods..

deleteAccount = (accountId, cb) ->
  console.log "Deleting account : #{accountId}"
  setTimeout ()->
    data =
      error : "Unable to delete, try again in a moment"
    if Math.random() > 0.6 then data.error = false
    cb data
  ,
    1200 * Math.random()

endpointTester = (endpoint, cb) ->
  console.log "Testing endpoint : #{endpoint} (fake)"
  setTimeout ()=>
    data =
      provider : shim.getUnofficialProvider()
      error    : "Unable to reach endpoint."
    if Math.random() > 0.6 then data.error = false
    cb data
  ,
    1200 * Math.random()

verifyAccount = (provider, fields, endpoint, cb)->
  console.log "Verifying Account:"
  console.log "  fields:"
  console.log fields
  console.log "  provider:"
  console.log provider
  console.log "  endpoint:\n  #{endpoint}"
  setTimeout ()->
    data =
      error: "Unable to connect with your credentials"
    if Math.random() < 0.6 then data.error = false
    cb data
  ,
    1200 * Math.random()

updateProvider = (data, cb) ->
  console.log "UPDATED DATA"
  console.log "------------------------------------------------"
  console.log data
  setTimeout ()->
    data =
      error: "Unable to save.."
    if Math.random() < 0.6 then data.error = false
    cb data
  ,
    1200 * Math.random()

addProviderClick = () -> console.log 'add provider clicked'



params =
  accounts         : shim.getAccounts()
  endpointTester   : endpointTester
  verifyAccount    : verifyAccount
  updateProvider   : updateProvider
  deleteAccount    : deleteAccount
  addProviderClick : addProviderClick


app = new nanobox.ProviderAccounts( $(".main-holder"), params )
