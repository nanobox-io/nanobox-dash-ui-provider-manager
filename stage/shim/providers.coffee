module.exports = class ProvidersShim

  constructor: () ->

  getProviders : () ->
    [
      {
        name            : "Personal"
        id              : "abc123"
        provider        : 'Digital Ocean'
        providerIcon    : "digital-ocean"
        defaultRegion   : {name:"Amsterdam 2", id:"am2"}
        providerRegions : [
          {name: "New York 1", id: "nyc1"}
          {name: "New York 2", id: "nyc2"}
          {name: "New York 3", id: "nyc3"}
          {name: "Amsterdam 2", id: "am2"}
          {name: "Amsterdam 3", id: "am3"}
          {name: "San Francisco", id: "sfo1"}
          {name: "Singapore", id: "s1"}
          {name: "London", id: "l1"}
          {name: "Frankfurt", id: "f1"}
          {name: "Toronto", id: "t1"}
        ]
        authFields      : [
          {label:'API Key', key:'api_key', val:"asdf" }
          {label:'User Name', key:'user', val:"asdf" }
          {label:'Password', key:'pass', val:"asdf" }
        ]
        apps            : [
          {name:"home", id:"abcd"}
          {name:"home", id:"abcd"}
          {name:"home", id:"abcd"}
          {name:"home", id:"abcd"}
          {name:"home", id:"abcd"}
          {name:"guides", id:"defg"}
        ]
      }
      ,
      {
        name            : "Work - Delorum"
        id              : "xyz789"
        provider        : 'Google Compute'
        providerIcon    : "google-compute"
        defaultRegion   : {name:"Singapore", id:"s1"}
        providerRegions : [
          {name: "New York 1", id: "nyc1"}
          {name: "New York 2", id: "nyc2"}
          {name: "New York 3", id: "nyc3"}
          {name: "Amsterdam 2", id: "am2"}
          {name: "Amsterdam 3", id: "am3"}
          {name: "San Francisco", id: "sfo1"}
          {name: "Singapore", id: "s1"}
          {name: "London", id: "l1"}
          {name: "Frankfurt", id: "f1"}
          {name: "Toronto", id: "t1"}
        ]
        authFields      : [
          {label:'API Key', key:'api_key', val:"asdf" }
        ]
        apps            : [
          {name:"home", id:"abcd"}
        ]
      }
    ]
