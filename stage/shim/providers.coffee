module.exports = class ProvidersShim

  constructor: () ->

  getAccounts : () ->
    [
      {
        name            : "Personal"
        id              : "abc123"
        defaultRegion   : {name:"Amsterdam 2", id:"am2"}
        provider:
          id:'do'
          name:"Personal"
          icon:'digital-ocean'
          endpoint        : "http://some.endpoint.com/asdf"
          defaultRegion   : {name: "New York 1", id: "nyc1"}
          regions: [
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
            {label:'API Key', key:'api_key', val:"asdf12345asdf12344" }
            {label:'User Name', key:'user', val:"john" }
            {label:'Password', key:'pass', val:"morovitch" }
          ]
          meta:
            instructions:'Grab your credentials on <a href="#">Ted\'s main site</a> , or view Ted\'s<a href="#">full guide</a>.'
        apps            : [
          {name:"guides", id:"defg"}
          {name:"app 1", id:"abcd1"}
          {name:"app 2", id:"abcd2"}
          {name:"app 3", id:"abcd3"}
          {name:"app 4", id:"abcd4"}
          {name:"app 5", id:"abcd5"}
        ]
      }
      ,
      {
        name            : "Work - Delorum"
        id              : "xyz789"
        defaultRegion   : {"New York 1", id: "nyc1"}
        provider        :
          name:'Google Compute'
          icon:'google-compute'
          id:'google'
          authFields:[
            {label:'API Key', key:'api_key', val:"asdf" }
          ]
          regions:[
            {name: "New York 1", id: "nyc1"}
            {name: "New York 2", id: "nyc2"}
            {name: "New York 3", id: "nyc3"}
          ]
          meta:
            instructions:'Create an API key on your <a href="#">Google Compute API page</a>, or view the <a href="//docs.nanobox.io">full guide</a>.'
        defaultRegion   : {name:"Singapore", id:"s1"}
        apps            : [
          {name:"home", id:"abcd"}
        ]
      }
    ]

  getUnofficialProvider : () ->
    {
      name:"Ted's Hosting"
      icon:'digital-ocean'
      id:'do'
      authFields:[
        {label:"Ted's Fav Color", key:'fav_color'}
        {label:'User Name', key:'user_name'}
        {label:'Password', key:'pass'}
      ]
      regions:[
        {name: "Ted's House", id: "ted1"}
        {name: "Ted's Basement", id: "ted2"}
        {name: "Ted's Attic", id: "ted3"}
      ]
      meta:
        instructions:'Grab your credentials on <a href="#">Ted\'s main site</a> , or view Ted\'s<a href="#">full guide</a>.'
    }
