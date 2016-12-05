providerEdit         = require 'jade/provider-edit'
providerSpecificVals = require 'jade/provider-specific-vals'
select               = require 'jade/select'

module.exports = class Provider

  constructor: ($el, @accountData, @testEndpoint, @verifyAccount, @save, onCancel) ->
    @provider      = @accountData.provider    # provider
    @validEndpoint = @provider.endpoint       # Initial endpint if it exists
    if @accountData.provider.endpoint?
      @accountData.isCustom = true
    @$node = $ providerEdit( @accountData )
    $el.append @$node
    @$testEndpointBtn = $("#test-endpoint", @$node)
    @$saveBtn         = $("#save", @$node)

    $("#cancel", @$node).on   'click', onCancel
    @$saveBtn.on              'click', (e)=> @onSaveClick()
    $("#endpoint", @$node).on 'input', (e)=> @onEndpointEdit e.currentTarget.value

    @$testEndpointBtn.on 'click', (e)=>
      @endpoint = $("#endpoint", @$node).val()
      @onTestEndpoint @endpoint

    @$authFields = $(".provider-specific", @$node)
    @addAuthFields()

    castShadows(@$node)

  # ------------------------------------ Events

  onEndpointEdit : (newVal) ->
    @validEndpoint = null
    if newVal != @accountData.endpoint
      @$testEndpointBtn.removeClass 'hidden'
      @$testEndpointBtn.removeClass 'success'
      @$testEndpointBtn.text 'Test Endpoint'
    else
      @$testEndpointBtn.addClass 'hidden'

  onTestEndpoint : (endpoint) ->
    @$testEndpointBtn.addClass 'ing'
    @$testEndpointBtn.text 'Testing...'
    $(".errors", @$node).addClass 'hidden'
    # Test the endpoint
    @testEndpoint endpoint, (results)=>
      @$testEndpointBtn.removeClass 'ing'
      # Error!
      if results.error
        @validEndpoint = null
        @addError results.error
        @$testEndpointBtn.text 'Test Endpoint'
      # Valid Endpoint
      else
        @provider = results.provider
        @validEndpoint = endpoint
        @$testEndpointBtn.text 'Success!'
        @$testEndpointBtn.addClass 'success'
        # add the auth fields for the newly retrieved endpoint
        @addAuthFields()

  onSaveClick : () ->
    @clearErrors()
    @$saveBtn.text('Verifying').addClass 'ing'
    authFields = {}
    for item in $(".auth-field", @$node)
      authFields[item.getAttribute('data-key')] = item.value

    @verifyAccount @provider, authFields, @validEndpoint, (results)=>
      # Error verifying account:
      if results.error
        @addError results.error
        @$saveBtn.text('Save').removeClass 'ing'
      # Account verification successful!
      else
        @$saveBtn.text('Saving')
        # Grab all the data and save it via rails:
        data = {}
        $nonAuthFields = $("input:not(.auth-field)")
        for item in $nonAuthFields
          data[item.getAttribute('data-key')] = item.value
        data.authFields = authFields
        data.defaultRegion = $("#regions select")[0].value
        @save data, (saveResults)=>
          # Error Saving:
          if saveResults.error
            @$saveBtn.text('Save').removeClass 'ing'
            @addError saveResults.error
          # Save Successful!
          else
            @$saveBtn.text('Saved!').removeClass('ing').addClass "success"
            setTimeout "location.reload(true);", 1000

  # ------------------------------------ Helpers

  addAuthFields : () ->
    @$authFields.empty()
    # set auth fields to empty strings if there is no user specified content
    for field in @provider.authFields
      if !field.val?
        field.val = ""
    $node = $ providerSpecificVals( {account:@accountData, provider:@provider} )
    @$authFields.append $node

    # Add the regions dropdown
    for region in @provider.regions
      if region.id == @accountData.defaultRegion.id
        region.selected = true
    $select = $(select( {items:@provider.regions} ))
    $select.val @accountData.defaultRegion.id
    $("#regions", $node).append $select
    lexify $("#regions", $node)

  addError : (error) ->
    $(".errors", @$node).text(error).removeClass 'hidden'

  clearErrors : () ->
    $(".errors", @$node).addClass 'hidden'

  destroy : ()->
    $("#cancel", @$node).off()
    $("#save", @$node).off()
    @$node.remove()
