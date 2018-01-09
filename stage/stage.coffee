RainbowBridge = require './rainbow-bridge'

# Data for instantiating legacy component
data =
  # The component we want to create, maybe should be a string?
  component   : 'ProviderAccounts'
  # A list of the callbacks this component will call
  callbacks   : ['endpointTester', 'verifyAccount', 'updateProvider', 'addProviderClick']
  # The elm message to retrieve the data this component needs for instantiation
  getInitData : 'getAccountData'

bridge = new RainbowBridge($(".main-holder"), data)
# bridge.instantiateComponent
