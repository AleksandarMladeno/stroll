// Generated by CoffeeScript 1.6.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['phaser'], function() {
    var Background, C, Group, Rectangle;
    Group = Phaser.Group;
    Rectangle = Phaser.Rectangle;
    Background = (function(_super) {

      __extends(Background, _super);

      Background.prototype.parallaxFactor = 0.9;

      Background.prototype.parallaxBuffer = 2.0;

      Background.prototype.parallaxTolerance = 0;

      Background.prototype.bounds = null;

      Background.prototype.mode = 0;

      Background.CLIP_BGS = 1;

      Background.FULL_BGS = 2;

      function Background(game, maxSize) {
        this.game = game;
        this.maxSize = maxSize != null ? maxSize : 0;
        this.bounds = new Rectangle();
        this.mode = C.FULL_BGS;
        Background.__super__.constructor.call(this, this.game, this.maxSize);
      }

      Background.prototype.destroy = function() {
        Background.__super__.destroy.call(this);
        return this.bounds = null;
      };

      Background.prototype.layout = function() {};

      return Background;

    })(Phaser.Group);
    return C = Background;
  });

}).call(this);
