var canvas = document.getElementById('canvas'),
    readout = document.getElementById('readout'),
    ctx = canvas.getContext('2d'),
    spritesheet = new Image();

//////////////////////////////////////////////////////////////

function windowToCanvas(canvas, x, y){
  var bbox = canvas.getBoundingClientRect();
  return {x: x - bbox.left * (canvas.width/bbox.width),
          y: y - bbox.top * (canvas.height/bbox.height)};
}

function drawBackground(){
  var verticalLineSpacing = 12,
      i = ctx.canvas.height;
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.storkeStyle = 'lightgray';
  ctx.lineWidth = 0.5;

  while (i> verticalLineSpacing*4) {
    ctx.beginPath();
    ctx.moveTo(0,i);
    ctx.lineTo(ctx.canvas.width,i);
    ctx.stroke();
    i-= verticalLineSpacing;
  }
}

function drawSpritesheet(){
  ctx.drawImage(spritesheet, 0, 0);
}

function drawGuidelines(x, y){
  ctx.strokeStyle = 'rgba(0,0,230,0.6)';
  ctx.lineWidth = 0.5;
  drawVerticalLine(x);
  drawHorizontalLine(y);
}

function updateReadout(x, y){
  readout.innerText = '(' + x.toFixed(0) +', ' + y.toFixed(0) + ')';
}

function drawHorizontalLine(y){
  ctx.beginPath();
  ctx.moveTo(0, y + 0.5);
  ctx.lineTo(ctx.canvas.width, y + 0.5);
  ctx.stroke();
}

function drawVerticalLine(x){
  ctx.beginPath();
  ctx.moveTo(x + 0.5 , 0);
  ctx.lineTo(x + 0.5, ctx.canvas.height);
  ctx.stroke();
}



//==============================================================


canvas.onmousemove = function(e){
  var loc = windowToCanvas(canvas, e.clientX, e.clientY);

  drawBackground();
  drawSpritesheet();
  drawGuidelines(loc.x,loc.y);
  updateReadout(loc.x,loc.y);
}


//================================================================

spritesheet.src = 'running.png';
spritesheet.onload = function(e){
  drawSpritesheet();

};

drawBackground();
