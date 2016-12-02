ProvidersShim = require './shim/providers'

shim = new ProvidersShim()

# ------------------------------------ Simulate rails methods..
endpointTester : (endpoint) ->
  console.log "Testing endpoint : #{endpoint} (fake)"
  setTimeout ()=>
    data =
      error    : "Unable to reach endpoint."
      provider : providerShim.getUnofficialProvider()
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

updateProvider : (provider) ->
  console.log "updating provider:"
  console.log provider

params =
  providers       : shim.getProviders()
  endpointTester  : endpointTester
  verifyAccount   : verifyAccount
  updateProvider  : updateProvider

app = new nanobox.Providers( $(".main-holder"), params )
