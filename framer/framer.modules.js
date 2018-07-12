require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
!function(a,n){"function"==typeof define&&define.amd?define(n):"object"==typeof exports?module.exports=n(require,exports,module):a.CountUp=n()}(this,function(a,n,t){var e=function(a,n,t,e,i,r){function o(a){var n,t,e,i,r,o,s=a<0;if(a=Math.abs(a).toFixed(l.decimals),a+="",n=a.split("."),t=n[0],e=n.length>1?l.options.decimal+n[1]:"",l.options.useGrouping){for(i="",r=0,o=t.length;r<o;++r)0!==r&&r%3===0&&(i=l.options.separator+i),i=t[o-r-1]+i;t=i}return l.options.numerals.length&&(t=t.replace(/[0-9]/g,function(a){return l.options.numerals[+a]}),e=e.replace(/[0-9]/g,function(a){return l.options.numerals[+a]})),(s?"-":"")+l.options.prefix+t+e+l.options.suffix}function s(a,n,t,e){return t*(-Math.pow(2,-10*a/e)+1)*1024/1023+n}function u(a){return"number"==typeof a&&!isNaN(a)}var l=this;if(l.version=function(){return"1.9.3"},l.options={useEasing:!0,useGrouping:!0,separator:",",decimal:".",easingFn:s,formattingFn:o,prefix:"",suffix:"",numerals:[]},r&&"object"==typeof r)for(var m in l.options)r.hasOwnProperty(m)&&null!==r[m]&&(l.options[m]=r[m]);""===l.options.separator?l.options.useGrouping=!1:l.options.separator=""+l.options.separator;for(var d=0,c=["webkit","moz","ms","o"],f=0;f<c.length&&!window.requestAnimationFrame;++f)window.requestAnimationFrame=window[c[f]+"RequestAnimationFrame"],window.cancelAnimationFrame=window[c[f]+"CancelAnimationFrame"]||window[c[f]+"CancelRequestAnimationFrame"];window.requestAnimationFrame||(window.requestAnimationFrame=function(a,n){var t=(new Date).getTime(),e=Math.max(0,16-(t-d)),i=window.setTimeout(function(){a(t+e)},e);return d=t+e,i}),window.cancelAnimationFrame||(window.cancelAnimationFrame=function(a){clearTimeout(a)}),l.initialize=function(){return!!l.initialized||(l.error="",l.d="string"==typeof a?document.getElementById(a):a,l.d?(l.startVal=Number(n),l.endVal=Number(t),u(l.startVal)&&u(l.endVal)?(l.decimals=Math.max(0,e||0),l.dec=Math.pow(10,l.decimals),l.duration=1e3*Number(i)||2e3,l.countDown=l.startVal>l.endVal,l.frameVal=l.startVal,l.initialized=!0,!0):(l.error="[CountUp] startVal ("+n+") or endVal ("+t+") is not a number",!1)):(l.error="[CountUp] target is null or undefined",!1))},l.printValue=function(a){var n=l.options.formattingFn(a);"INPUT"===l.d.tagName?this.d.value=n:"text"===l.d.tagName||"tspan"===l.d.tagName?this.d.textContent=n:this.d.innerHTML=n},l.count=function(a){l.startTime||(l.startTime=a),l.timestamp=a;var n=a-l.startTime;l.remaining=l.duration-n,l.options.useEasing?l.countDown?l.frameVal=l.startVal-l.options.easingFn(n,0,l.startVal-l.endVal,l.duration):l.frameVal=l.options.easingFn(n,l.startVal,l.endVal-l.startVal,l.duration):l.countDown?l.frameVal=l.startVal-(l.startVal-l.endVal)*(n/l.duration):l.frameVal=l.startVal+(l.endVal-l.startVal)*(n/l.duration),l.countDown?l.frameVal=l.frameVal<l.endVal?l.endVal:l.frameVal:l.frameVal=l.frameVal>l.endVal?l.endVal:l.frameVal,l.frameVal=Math.round(l.frameVal*l.dec)/l.dec,l.printValue(l.frameVal),n<l.duration?l.rAF=requestAnimationFrame(l.count):l.callback&&l.callback()},l.start=function(a){l.initialize()&&(l.callback=a,l.rAF=requestAnimationFrame(l.count))},l.pauseResume=function(){l.paused?(l.paused=!1,delete l.startTime,l.duration=l.remaining,l.startVal=l.frameVal,requestAnimationFrame(l.count)):(l.paused=!0,cancelAnimationFrame(l.rAF))},l.reset=function(){l.paused=!1,delete l.startTime,l.initialized=!1,l.initialize()&&(cancelAnimationFrame(l.rAF),l.printValue(l.startVal))},l.update=function(a){if(l.initialize()){if(a=Number(a),!u(a))return void(l.error="[CountUp] update() - new endVal is not a number: "+a);l.error="",a!==l.frameVal&&(cancelAnimationFrame(l.rAF),l.paused=!1,delete l.startTime,l.startVal=l.frameVal,l.endVal=a,l.countDown=l.startVal>l.endVal,l.rAF=requestAnimationFrame(l.count))}},l.initialize()&&l.printValue(l.startVal)};return e});
},{}],"IconsNavBar":[function(require,module,exports){
var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.IconsNavBar = (function(superClass) {
  var n;

  extend(IconsNavBar, superClass);

  n = Screen.width / 750;

  function IconsNavBar(options) {
    this.options = options != null ? options : {};
    this.TouchMove = bind(this.TouchMove, this);
    this.TouchEnd = bind(this.TouchEnd, this);
    this.TouchStart = bind(this.TouchStart, this);
    _.defaults(this.options, {
      backgroundColor: "#FFF",
      height: 160 * n
    });
    this.navIconPic = new Layer({
      width: 48 * n,
      height: 48 * n,
      backgroundColor: "null",
      image: "images/nav_icon01.svg",
      backgroundColor: null
    });
    this.navIconName = new TextLayer({
      height: 40 * n,
      fontSize: 24 * n,
      fontWeight: 800,
      color: "#2D2929",
      text: "iconname",
      textAlign: "center"
    });
    IconsNavBar.__super__.constructor.call(this, this.options);
    this.navIconPic.parent = this;
    this.navIconPic.x = Align.center;
    this.navIconPic.y = 32 * n;
    this.navIconName.parent = this;
    this.navIconName.y = 96 * n;
    this.navIconName.width = this.width;
    this.onTouchStart(this.TouchStart);
    this.onTouchEnd(this.TouchEnd);
    this.onTouchMove(this.TouchEnd);
  }

  IconsNavBar.prototype.TouchStart = function() {
    return this.brightness = 90;
  };

  IconsNavBar.prototype.TouchEnd = function() {
    return this.brightness = 100;
  };

  IconsNavBar.prototype.TouchMove = function() {
    return this.brightness = 100;
  };

  return IconsNavBar;

})(Layer);


},{}],"StatusBar":[function(require,module,exports){
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.StatusBar = (function(superClass) {
  var n;

  extend(StatusBar, superClass);

  n = Screen.width / 750;

  function StatusBar(options) {
    var backgroundBlur;
    this.options = options != null ? options : {};
    _.defaults(this.options, {
      backgroundColor: "#FFF",
      width: Screen.width,
      height: 40 * n,
      opacity: 0.96,
      image: "images/Status Bar (White).png",
      z: 4
    }, backgroundBlur = 40);
    this.topbar = new Layer({
      width: Screen.width,
      height: 88 * n,
      backgroundColor: "#FFF"
    });
    this.pageTitle = new TextLayer({
      fontSize: 34 * n,
      fontWeight: 800,
      color: "#2D2929",
      backgroundColor: null,
      textAlign: "center",
      x: Align.center,
      width: Screen.width
    });
    this.topbarRightIcon01 = new Layer({
      width: 32 * n,
      height: 32 * n,
      backgroundColor: null,
      x: Align.right(-32 * n),
      image: "images/nav_icon_mess@2x.svg"
    });
    this.topbarLeftIcon01 = new Layer({
      width: 32 * n,
      height: 32 * n,
      backgroundColor: null,
      x: Align.left(32 * n),
      image: "images/nav_icon_back@2x.svg"
    });
    StatusBar.__super__.constructor.call(this, this.options);
    this.topbar.parent = this;
    this.topbar.y = 40 * n;
    this.pageTitle.parent = this.topbar;
    this.topbarRightIcon01.parent = this.topbar;
    this.topbarRightIcon01.y = Align.center();
    this.topbarLeftIcon01.parent = this.topbar;
    this.topbarLeftIcon01.y = Align.center();
    this.pageTitle.y = Align.center();
    this.pageTitle.text = "PageName";
  }

  return StatusBar;

})(Layer);


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}],"npm":[function(require,module,exports){
exports.countup = require("countup.js");


},{"countup.js":1}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL2FkL0Rlc2t0b3AvZnJhbWVyL2ppbnJvbmdqaWEuZnJhbWVyL21vZHVsZXMvbnBtLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL2FkL0Rlc2t0b3AvZnJhbWVyL2ppbnJvbmdqaWEuZnJhbWVyL21vZHVsZXMvbXlNb2R1bGUuY29mZmVlIiwiLi4vLi4vLi4vLi4vLi4vVXNlcnMvYWQvRGVza3RvcC9mcmFtZXIvamlucm9uZ2ppYS5mcmFtZXIvbW9kdWxlcy9TdGF0dXNCYXIuY29mZmVlIiwiLi4vLi4vLi4vLi4vLi4vVXNlcnMvYWQvRGVza3RvcC9mcmFtZXIvamlucm9uZ2ppYS5mcmFtZXIvbW9kdWxlcy9JY29uc05hdkJhci5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy9hZC9EZXNrdG9wL2ZyYW1lci9qaW5yb25namlhLmZyYW1lci9jb3VudHVwLmpzL2Rpc3QvY291bnRVcC5taW4uanMiLCJub2RlX21vZHVsZXMvYnJvd3Nlci1wYWNrL19wcmVsdWRlLmpzIl0sInNvdXJjZXNDb250ZW50IjpbIiMgRmlsZTogbW9kdWxlcy9ucG0uY29mZmVlXG5cbmV4cG9ydHMuY291bnR1cCA9IHJlcXVpcmUgXCJjb3VudHVwLmpzXCJcbiIsIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iLCJjbGFzcyBleHBvcnRzLlN0YXR1c0JhciBleHRlbmRzIExheWVyXG5cdG4gPSBTY3JlZW4ud2lkdGgvNzUwXG5cdGNvbnN0cnVjdG9yOiAoQG9wdGlvbnM9e30pIC0+XG5cdFx0Xy5kZWZhdWx0cyBAb3B0aW9ucyxcblx0XHRcdGJhY2tncm91bmRDb2xvcjogXCIjRkZGXCJcblx0XHRcdHdpZHRoOiBTY3JlZW4ud2lkdGhcblx0XHRcdGhlaWdodDogNDAqblxuXHRcdFx0b3BhY2l0eTogMC45NlxuXHRcdFx0aW1hZ2U6IFwiaW1hZ2VzL1N0YXR1cyBCYXIgKFdoaXRlKS5wbmdcIlxuXHRcdFx0ejo0XG5cdFx0XHRiYWNrZ3JvdW5kQmx1ciA9IDQwXG5cdFx0QHRvcGJhciA9IG5ldyBMYXllclxuXHRcdFx0d2lkdGg6IFNjcmVlbi53aWR0aFxuXHRcdFx0aGVpZ2h0OiA4OCpuXG5cdFx0XHRiYWNrZ3JvdW5kQ29sb3I6IFwiI0ZGRlwiXG5cdFxuXHRcdEBwYWdlVGl0bGUgPSBuZXcgVGV4dExheWVyXG5cdFx0XHRmb250U2l6ZTozNCpuXG5cdFx0XHRmb250V2VpZ2h0OjgwMFxuXHRcdFx0Y29sb3I6XCIjMkQyOTI5XCJcblx0XHRcdGJhY2tncm91bmRDb2xvcjogbnVsbFxuXHRcdFx0dGV4dEFsaWduOiBcImNlbnRlclwiXG5cdFx0XHR4OkFsaWduLmNlbnRlclxuXHRcdFx0d2lkdGg6U2NyZWVuLndpZHRoXG5cblx0XHRAdG9wYmFyUmlnaHRJY29uMDEgPSBuZXcgTGF5ZXJcblx0XHRcdHdpZHRoOiAzMipuXG5cdFx0XHRoZWlnaHQ6MzIqblxuXHRcdFx0YmFja2dyb3VuZENvbG9yOiBudWxsXG5cdFx0XHR4OiBBbGlnbi5yaWdodCgtMzIqbilcblx0XHRcdGltYWdlOiBcImltYWdlcy9uYXZfaWNvbl9tZXNzQDJ4LnN2Z1wiXG5cdFx0XHRcblx0XHRAdG9wYmFyTGVmdEljb24wMSA9IG5ldyBMYXllclxuXHRcdFx0d2lkdGg6IDMyKm5cblx0XHRcdGhlaWdodDozMipuXG5cdFx0XHRiYWNrZ3JvdW5kQ29sb3I6IG51bGxcblx0XHRcdHg6IEFsaWduLmxlZnQoMzIqbilcblx0XHRcdGltYWdlOiBcImltYWdlcy9uYXZfaWNvbl9iYWNrQDJ4LnN2Z1wiXG5cblx0XHRzdXBlciBAb3B0aW9uc1xuXHRcdFxuXHRcdEB0b3BiYXIucGFyZW50ID0gQFxuXHRcdEB0b3BiYXIueSA9IDQwKm5cblx0XHRAcGFnZVRpdGxlLnBhcmVudCA9IEB0b3BiYXJcblx0XHRAdG9wYmFyUmlnaHRJY29uMDEucGFyZW50ID0gQHRvcGJhclxuXHRcdEB0b3BiYXJSaWdodEljb24wMS55ID0gQWxpZ24uY2VudGVyKClcblx0XHRAdG9wYmFyTGVmdEljb24wMS5wYXJlbnQgPSBAdG9wYmFyXG5cdFx0QHRvcGJhckxlZnRJY29uMDEueSA9IEFsaWduLmNlbnRlcigpXG5cdFx0QHBhZ2VUaXRsZS55ID0gQWxpZ24uY2VudGVyKClcblx0XHRAcGFnZVRpdGxlLnRleHQgPSBcIlBhZ2VOYW1lXCJcblx0XHRcblx0XG4iLCJjbGFzcyBleHBvcnRzLkljb25zTmF2QmFyIGV4dGVuZHMgTGF5ZXJcblx0biA9IFNjcmVlbi53aWR0aC83NTBcblx0Y29uc3RydWN0b3I6IChAb3B0aW9ucz17fSkgLT5cblx0XHRfLmRlZmF1bHRzIEBvcHRpb25zLFxuXHRcdFx0YmFja2dyb3VuZENvbG9yOlwiI0ZGRlwiXG5cdFx0XHRoZWlnaHQ6IDE2MCpuXG5cdFx0XG5cdFx0QG5hdkljb25QaWMgPSBuZXcgTGF5ZXJcblx0XHRcdHdpZHRoOjQ4Km5cblx0XHRcdGhlaWdodDo0OCpuXG5cdFx0XHRiYWNrZ3JvdW5kQ29sb3I6XCJudWxsXCJcblx0XHRcdGltYWdlOlwiaW1hZ2VzL25hdl9pY29uMDEuc3ZnXCJcblx0XHRcdGJhY2tncm91bmRDb2xvcjpudWxsXG5cdFx0XG5cdFx0QG5hdkljb25OYW1lID0gbmV3IFRleHRMYXllclxuXHRcdFx0aGVpZ2h0OjQwKm5cblx0XHRcdGZvbnRTaXplOjI0Km5cblx0XHRcdGZvbnRXZWlnaHQ6ODAwXG5cdFx0XHRjb2xvcjpcIiMyRDI5MjlcIlxuXHRcdFx0dGV4dDpcImljb25uYW1lXCJcblx0XHRcdHRleHRBbGlnbjpcImNlbnRlclwiXG5cdFx0XHRcblx0XHRzdXBlciBAb3B0aW9uc1xuXHRcdFxuXHRcdEBuYXZJY29uUGljLnBhcmVudCA9IEBcblx0XHRAbmF2SWNvblBpYy54ID0gQWxpZ24uY2VudGVyXG5cdFx0QG5hdkljb25QaWMueSA9IDMyKm5cblx0XHRAbmF2SWNvbk5hbWUucGFyZW50ID0gQFxuXHRcdEBuYXZJY29uTmFtZS55ID0gOTYqblxuXHRcdEBuYXZJY29uTmFtZS53aWR0aCA9IEAud2lkdGhcblx0XHRALm9uVG91Y2hTdGFydCBAVG91Y2hTdGFydFxuXHRcdEAub25Ub3VjaEVuZCBAVG91Y2hFbmRcblx0XHRALm9uVG91Y2hNb3ZlIEBUb3VjaEVuZFxuXG5cdFRvdWNoU3RhcnQ6ID0+XG5cdFx0QC5icmlnaHRuZXNzID0gOTBcblx0VG91Y2hFbmQ6ID0+XG5cdFx0QC5icmlnaHRuZXNzID0gMTAwXG5cdFRvdWNoTW92ZTogPT5cblx0XHRALmJyaWdodG5lc3MgPSAxMDAiLCIhZnVuY3Rpb24oYSxuKXtcImZ1bmN0aW9uXCI9PXR5cGVvZiBkZWZpbmUmJmRlZmluZS5hbWQ/ZGVmaW5lKG4pOlwib2JqZWN0XCI9PXR5cGVvZiBleHBvcnRzP21vZHVsZS5leHBvcnRzPW4ocmVxdWlyZSxleHBvcnRzLG1vZHVsZSk6YS5Db3VudFVwPW4oKX0odGhpcyxmdW5jdGlvbihhLG4sdCl7dmFyIGU9ZnVuY3Rpb24oYSxuLHQsZSxpLHIpe2Z1bmN0aW9uIG8oYSl7dmFyIG4sdCxlLGkscixvLHM9YTwwO2lmKGE9TWF0aC5hYnMoYSkudG9GaXhlZChsLmRlY2ltYWxzKSxhKz1cIlwiLG49YS5zcGxpdChcIi5cIiksdD1uWzBdLGU9bi5sZW5ndGg+MT9sLm9wdGlvbnMuZGVjaW1hbCtuWzFdOlwiXCIsbC5vcHRpb25zLnVzZUdyb3VwaW5nKXtmb3IoaT1cIlwiLHI9MCxvPXQubGVuZ3RoO3I8bzsrK3IpMCE9PXImJnIlMz09PTAmJihpPWwub3B0aW9ucy5zZXBhcmF0b3IraSksaT10W28tci0xXStpO3Q9aX1yZXR1cm4gbC5vcHRpb25zLm51bWVyYWxzLmxlbmd0aCYmKHQ9dC5yZXBsYWNlKC9bMC05XS9nLGZ1bmN0aW9uKGEpe3JldHVybiBsLm9wdGlvbnMubnVtZXJhbHNbK2FdfSksZT1lLnJlcGxhY2UoL1swLTldL2csZnVuY3Rpb24oYSl7cmV0dXJuIGwub3B0aW9ucy5udW1lcmFsc1srYV19KSksKHM/XCItXCI6XCJcIikrbC5vcHRpb25zLnByZWZpeCt0K2UrbC5vcHRpb25zLnN1ZmZpeH1mdW5jdGlvbiBzKGEsbix0LGUpe3JldHVybiB0KigtTWF0aC5wb3coMiwtMTAqYS9lKSsxKSoxMDI0LzEwMjMrbn1mdW5jdGlvbiB1KGEpe3JldHVyblwibnVtYmVyXCI9PXR5cGVvZiBhJiYhaXNOYU4oYSl9dmFyIGw9dGhpcztpZihsLnZlcnNpb249ZnVuY3Rpb24oKXtyZXR1cm5cIjEuOS4zXCJ9LGwub3B0aW9ucz17dXNlRWFzaW5nOiEwLHVzZUdyb3VwaW5nOiEwLHNlcGFyYXRvcjpcIixcIixkZWNpbWFsOlwiLlwiLGVhc2luZ0ZuOnMsZm9ybWF0dGluZ0ZuOm8scHJlZml4OlwiXCIsc3VmZml4OlwiXCIsbnVtZXJhbHM6W119LHImJlwib2JqZWN0XCI9PXR5cGVvZiByKWZvcih2YXIgbSBpbiBsLm9wdGlvbnMpci5oYXNPd25Qcm9wZXJ0eShtKSYmbnVsbCE9PXJbbV0mJihsLm9wdGlvbnNbbV09clttXSk7XCJcIj09PWwub3B0aW9ucy5zZXBhcmF0b3I/bC5vcHRpb25zLnVzZUdyb3VwaW5nPSExOmwub3B0aW9ucy5zZXBhcmF0b3I9XCJcIitsLm9wdGlvbnMuc2VwYXJhdG9yO2Zvcih2YXIgZD0wLGM9W1wid2Via2l0XCIsXCJtb3pcIixcIm1zXCIsXCJvXCJdLGY9MDtmPGMubGVuZ3RoJiYhd2luZG93LnJlcXVlc3RBbmltYXRpb25GcmFtZTsrK2Ypd2luZG93LnJlcXVlc3RBbmltYXRpb25GcmFtZT13aW5kb3dbY1tmXStcIlJlcXVlc3RBbmltYXRpb25GcmFtZVwiXSx3aW5kb3cuY2FuY2VsQW5pbWF0aW9uRnJhbWU9d2luZG93W2NbZl0rXCJDYW5jZWxBbmltYXRpb25GcmFtZVwiXXx8d2luZG93W2NbZl0rXCJDYW5jZWxSZXF1ZXN0QW5pbWF0aW9uRnJhbWVcIl07d2luZG93LnJlcXVlc3RBbmltYXRpb25GcmFtZXx8KHdpbmRvdy5yZXF1ZXN0QW5pbWF0aW9uRnJhbWU9ZnVuY3Rpb24oYSxuKXt2YXIgdD0obmV3IERhdGUpLmdldFRpbWUoKSxlPU1hdGgubWF4KDAsMTYtKHQtZCkpLGk9d2luZG93LnNldFRpbWVvdXQoZnVuY3Rpb24oKXthKHQrZSl9LGUpO3JldHVybiBkPXQrZSxpfSksd2luZG93LmNhbmNlbEFuaW1hdGlvbkZyYW1lfHwod2luZG93LmNhbmNlbEFuaW1hdGlvbkZyYW1lPWZ1bmN0aW9uKGEpe2NsZWFyVGltZW91dChhKX0pLGwuaW5pdGlhbGl6ZT1mdW5jdGlvbigpe3JldHVybiEhbC5pbml0aWFsaXplZHx8KGwuZXJyb3I9XCJcIixsLmQ9XCJzdHJpbmdcIj09dHlwZW9mIGE/ZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoYSk6YSxsLmQ/KGwuc3RhcnRWYWw9TnVtYmVyKG4pLGwuZW5kVmFsPU51bWJlcih0KSx1KGwuc3RhcnRWYWwpJiZ1KGwuZW5kVmFsKT8obC5kZWNpbWFscz1NYXRoLm1heCgwLGV8fDApLGwuZGVjPU1hdGgucG93KDEwLGwuZGVjaW1hbHMpLGwuZHVyYXRpb249MWUzKk51bWJlcihpKXx8MmUzLGwuY291bnREb3duPWwuc3RhcnRWYWw+bC5lbmRWYWwsbC5mcmFtZVZhbD1sLnN0YXJ0VmFsLGwuaW5pdGlhbGl6ZWQ9ITAsITApOihsLmVycm9yPVwiW0NvdW50VXBdIHN0YXJ0VmFsIChcIituK1wiKSBvciBlbmRWYWwgKFwiK3QrXCIpIGlzIG5vdCBhIG51bWJlclwiLCExKSk6KGwuZXJyb3I9XCJbQ291bnRVcF0gdGFyZ2V0IGlzIG51bGwgb3IgdW5kZWZpbmVkXCIsITEpKX0sbC5wcmludFZhbHVlPWZ1bmN0aW9uKGEpe3ZhciBuPWwub3B0aW9ucy5mb3JtYXR0aW5nRm4oYSk7XCJJTlBVVFwiPT09bC5kLnRhZ05hbWU/dGhpcy5kLnZhbHVlPW46XCJ0ZXh0XCI9PT1sLmQudGFnTmFtZXx8XCJ0c3BhblwiPT09bC5kLnRhZ05hbWU/dGhpcy5kLnRleHRDb250ZW50PW46dGhpcy5kLmlubmVySFRNTD1ufSxsLmNvdW50PWZ1bmN0aW9uKGEpe2wuc3RhcnRUaW1lfHwobC5zdGFydFRpbWU9YSksbC50aW1lc3RhbXA9YTt2YXIgbj1hLWwuc3RhcnRUaW1lO2wucmVtYWluaW5nPWwuZHVyYXRpb24tbixsLm9wdGlvbnMudXNlRWFzaW5nP2wuY291bnREb3duP2wuZnJhbWVWYWw9bC5zdGFydFZhbC1sLm9wdGlvbnMuZWFzaW5nRm4obiwwLGwuc3RhcnRWYWwtbC5lbmRWYWwsbC5kdXJhdGlvbik6bC5mcmFtZVZhbD1sLm9wdGlvbnMuZWFzaW5nRm4obixsLnN0YXJ0VmFsLGwuZW5kVmFsLWwuc3RhcnRWYWwsbC5kdXJhdGlvbik6bC5jb3VudERvd24/bC5mcmFtZVZhbD1sLnN0YXJ0VmFsLShsLnN0YXJ0VmFsLWwuZW5kVmFsKSoobi9sLmR1cmF0aW9uKTpsLmZyYW1lVmFsPWwuc3RhcnRWYWwrKGwuZW5kVmFsLWwuc3RhcnRWYWwpKihuL2wuZHVyYXRpb24pLGwuY291bnREb3duP2wuZnJhbWVWYWw9bC5mcmFtZVZhbDxsLmVuZFZhbD9sLmVuZFZhbDpsLmZyYW1lVmFsOmwuZnJhbWVWYWw9bC5mcmFtZVZhbD5sLmVuZFZhbD9sLmVuZFZhbDpsLmZyYW1lVmFsLGwuZnJhbWVWYWw9TWF0aC5yb3VuZChsLmZyYW1lVmFsKmwuZGVjKS9sLmRlYyxsLnByaW50VmFsdWUobC5mcmFtZVZhbCksbjxsLmR1cmF0aW9uP2wuckFGPXJlcXVlc3RBbmltYXRpb25GcmFtZShsLmNvdW50KTpsLmNhbGxiYWNrJiZsLmNhbGxiYWNrKCl9LGwuc3RhcnQ9ZnVuY3Rpb24oYSl7bC5pbml0aWFsaXplKCkmJihsLmNhbGxiYWNrPWEsbC5yQUY9cmVxdWVzdEFuaW1hdGlvbkZyYW1lKGwuY291bnQpKX0sbC5wYXVzZVJlc3VtZT1mdW5jdGlvbigpe2wucGF1c2VkPyhsLnBhdXNlZD0hMSxkZWxldGUgbC5zdGFydFRpbWUsbC5kdXJhdGlvbj1sLnJlbWFpbmluZyxsLnN0YXJ0VmFsPWwuZnJhbWVWYWwscmVxdWVzdEFuaW1hdGlvbkZyYW1lKGwuY291bnQpKToobC5wYXVzZWQ9ITAsY2FuY2VsQW5pbWF0aW9uRnJhbWUobC5yQUYpKX0sbC5yZXNldD1mdW5jdGlvbigpe2wucGF1c2VkPSExLGRlbGV0ZSBsLnN0YXJ0VGltZSxsLmluaXRpYWxpemVkPSExLGwuaW5pdGlhbGl6ZSgpJiYoY2FuY2VsQW5pbWF0aW9uRnJhbWUobC5yQUYpLGwucHJpbnRWYWx1ZShsLnN0YXJ0VmFsKSl9LGwudXBkYXRlPWZ1bmN0aW9uKGEpe2lmKGwuaW5pdGlhbGl6ZSgpKXtpZihhPU51bWJlcihhKSwhdShhKSlyZXR1cm4gdm9pZChsLmVycm9yPVwiW0NvdW50VXBdIHVwZGF0ZSgpIC0gbmV3IGVuZFZhbCBpcyBub3QgYSBudW1iZXI6IFwiK2EpO2wuZXJyb3I9XCJcIixhIT09bC5mcmFtZVZhbCYmKGNhbmNlbEFuaW1hdGlvbkZyYW1lKGwuckFGKSxsLnBhdXNlZD0hMSxkZWxldGUgbC5zdGFydFRpbWUsbC5zdGFydFZhbD1sLmZyYW1lVmFsLGwuZW5kVmFsPWEsbC5jb3VudERvd249bC5zdGFydFZhbD5sLmVuZFZhbCxsLnJBRj1yZXF1ZXN0QW5pbWF0aW9uRnJhbWUobC5jb3VudCkpfX0sbC5pbml0aWFsaXplKCkmJmwucHJpbnRWYWx1ZShsLnN0YXJ0VmFsKX07cmV0dXJuIGV9KTsiLCIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3ZhciBmPW5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIik7dGhyb3cgZi5jb2RlPVwiTU9EVUxFX05PVF9GT1VORFwiLGZ9dmFyIGw9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGwuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sbCxsLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUtBQTtBREFBOztBREFBLElBQUE7Ozs7QUFBTSxPQUFPLENBQUM7QUFDYixNQUFBOzs7O0VBQUEsQ0FBQSxHQUFJLE1BQU0sQ0FBQyxLQUFQLEdBQWE7O0VBQ0oscUJBQUMsT0FBRDtJQUFDLElBQUMsQ0FBQSw0QkFBRCxVQUFTOzs7O0lBQ3RCLENBQUMsQ0FBQyxRQUFGLENBQVcsSUFBQyxDQUFBLE9BQVosRUFDQztNQUFBLGVBQUEsRUFBZ0IsTUFBaEI7TUFDQSxNQUFBLEVBQVEsR0FBQSxHQUFJLENBRFo7S0FERDtJQUlBLElBQUMsQ0FBQSxVQUFELEdBQWtCLElBQUEsS0FBQSxDQUNqQjtNQUFBLEtBQUEsRUFBTSxFQUFBLEdBQUcsQ0FBVDtNQUNBLE1BQUEsRUFBTyxFQUFBLEdBQUcsQ0FEVjtNQUVBLGVBQUEsRUFBZ0IsTUFGaEI7TUFHQSxLQUFBLEVBQU0sdUJBSE47TUFJQSxlQUFBLEVBQWdCLElBSmhCO0tBRGlCO0lBT2xCLElBQUMsQ0FBQSxXQUFELEdBQW1CLElBQUEsU0FBQSxDQUNsQjtNQUFBLE1BQUEsRUFBTyxFQUFBLEdBQUcsQ0FBVjtNQUNBLFFBQUEsRUFBUyxFQUFBLEdBQUcsQ0FEWjtNQUVBLFVBQUEsRUFB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
