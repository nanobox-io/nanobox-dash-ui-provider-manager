#### Temporarily adding the data shim, this data would be provided by elm
ElmShim       = require './shim/elm-shim'
elmShim = new ElmShim()
####

module.exports = class RainbowBridge

  constructor: ($el, @config) ->
    @callbacks = {}

    elmShim.simulatePort @onElmMessage ## Temp for testing

    @sendElmMessage @config.getInitData, {}, (data)=>
      callbacks = @initComponentCallbacks()
      component = new nanobox[@config.component]( $(".main-holder"), data, callbacks )

  # Initialize component's callbacks
  initComponentCallbacks : () ->
    callbacks = {}
    for cbName in @config.callbacks
      callbacks[cbName] = (data, cb)=>
        @sendElmMessage(cbName, data, cb)
    return callbacks



  # Send a message out to elm
  # message : String
  # params  : hash of data to send to elm
  # cb      : optional callback
  sendElmMessage : (message, params={}, cb) ->
    # Data we're sending to elm
    data =
      uid    : new Date().getTime()
      params : params

    # Store the callback under our uid (if one exists)
    if cb?
      @callbacks[data.uid] = cb

    # Send message to elm port :
    # app.ports[message].send(data);

    #################### TEMP : FOR TESTING
    elmShim.send(message, data)
    #####################

  # When we receive a message from elm, call a callback if one exists
  onElmMessage : (data, uid) =>
    if @callbacks[uid]?
      @callbacks[uid](data)
      delete @callbacks[uid]
