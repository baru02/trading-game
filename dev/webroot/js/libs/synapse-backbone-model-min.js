(function(a,b){return typeof exports!="undefined"?b(a,exports,require("synapse/core"),require("backbone")):typeof define=="function"&&define.amd?define("synapse/backbone-model",["synapse/core","backbone","exports"],function(c,d,e){return b(a,e,c,d)}):a.BackboneModelHook=b(a,{},a.SynapseCore,a.Backbone)})(this,function(a,b,c){return{typeName:"Backbone Model",checkObjectType:function(a){return a instanceof Backbone.Model},getHandler:function(a,b){return c.isFunction(a[b])?a[b]():a.get(b)},setHandler:function(a,b,d){var e;return c.isFunction(a[b])?a[b](d):(e={},e[b]=d,a.set(e))},onEventHandler:function(a,b,c){return a.bind(b,c)},offEventHandler:function(a,b,c){return a.unbind(b,c)},triggerEventHandler:function(a,b){return a.trigger(b)},detectEvent:function(a,b){return b&&!a[b]?"change:"+b:"change"}}})