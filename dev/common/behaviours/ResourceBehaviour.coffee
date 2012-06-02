#node.js requirements
if require?
  _ = require 'underscore'
  SignalFactory = require '../config/SignalFactory'
  Types = require '../config/Types'

class ResourceBehaviour

    constructor: ( @resourceType ) ->

    getType: ->
        @resourceType

    requestAccept: ( signal, state ) ->

    accept: ( signal, callback ) ->

    route: ( state ) ->

    produce: ( state ) ->
        production = =>
            #check if we have engough resources to extract
            if state.life < state.extraction
                #resource depleted
                if @PID?
                    clearInterval @PID
            else
                #we have enough resources, mining...
                newSignal = SignalFactory.build Types.Entities.Signal, state.extraction, Types.Resources[@resourceType], state.field.platform.state.owner
                newSignal.path.push state.field.resource

                #can the platform accept the signal
                acceptable = state.field.platform.requestAccept newSignal

                if acceptable
                    #send the signal
                    state.life -= state.extraction
                    state.signals.push newSignal

                    state.field.platform.trigger "accept", newSignal, (signal) ->
                        state.signals = _.without state.signals, signal

        @PID = setInterval production, state.delay

if module? and module.exports
  exports = module.exports = ResourceBehaviour
else
  root['ResourceBehaviour'] = ResourceBehaviour