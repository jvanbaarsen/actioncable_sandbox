App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    @perform 'connected'
