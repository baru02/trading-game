if require?
    SignalFactory = require '../config/SignalFactory'
    Types = require '../config/Types'
else
    Types = window.Types
    SignalFactory = window.SignalFactory

class HQBehaviour

    constructor: ( @eventBus ) ->

    getType: ->
        Types.Platforms.HQ

    requestAccept: ( signal, state ) ->
        if signal.owner is state.owner
            availableRoutes = _.filter state.routing, (route, direction) ->
                route.in && route.object is signal.source
            availableRoutes.length > 0 and state.capacity + 1 <= state.signals.length
        else
            true

    produce: ( state ) ->
        if state.field.resource.type?
            state.field.resource.trigger 'produce'
        production = =>
                (
                    state.owner.addResource(SignalFactory.build Types.Entities.Signal, state.extraction, Types.Resources[res], state.owner)
                    @eventBus.trigger 'resource:produce', state.field.xy, state.extraction, Types.Resources[res]
                ) for res in Types.Resources.Names
        setInterval production, state.delay

    accept: ( signal, state, callback ) ->
        callback signal
        if signal.owner is state.owner
            state.owner.addResource signal
        else
            state.life -= signal.strength
            if state.life <= 0
                @eventBus.trigger 'player:lost', state.owner

    route: ( state ) ->

if module? and module.exports
  exports = module.exports = HQBehaviour
else
  window['HQBehaviour'] = HQBehaviour
