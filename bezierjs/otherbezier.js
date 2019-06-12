bezier = function(t, p0, p1, p2, p3){
  var cX = 3 * (p1.x - p0.x),
      bX = 3 * (p2.x - p1.x) - cX,
      aX = p3.x - p0.x - cX - bX;

  var cY = 3 * (p1.y - p0.y),
      bY = 3 * (p2.y - p1.y) - cY,
      aY = p3.y - p0.y - cY - bY;

  var x = (aX * Math.pow(t, 3)) + (bX * Math.pow(t, 2)) + (cX * t) + p0.x;
  var y = (aY * Math.pow(t, 3)) + (bY * Math.pow(t, 2)) + (cY * t) + p0.y;

  return {x: x, y: y};
},

(function(){
  var accuracy = 0.01, //this'll give the bezier 100 segments
      p0 = {x: 10, y: 10}, //use whatever points you want obviously
      p1 = {x: 50, y: 100},
      p2 = {x: 150, y: 200},
      p3 = {x: 200, y: 75},
      ctx = document.createElement('canvas').getContext('2d');

  ctx.width = 500;
  ctx.height = 500;
  document.body.appendChild(ctx.canvas);
