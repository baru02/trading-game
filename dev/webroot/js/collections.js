// Generated by CoffeeScript 1.3.3
(function() {
  var Games, Messages,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Games = (function(_super) {

    __extends(Games, _super);

    function Games() {
      return Games.__super__.constructor.apply(this, arguments);
    }

    Games.prototype.model = S.Models.Game;

    return Games;

  })(Backbone.Collection);

  window.S.Collections.Games = Games;

  Messages = (function(_super) {

    __extends(Messages, _super);

    function Messages() {
      return Messages.__super__.constructor.apply(this, arguments);
    }

    Messages.prototype.model = S.Models.Message;

    return Messages;

  })(Backbone.Collection);

  window.S.Collections.Messages = Messages;

}).call(this);
