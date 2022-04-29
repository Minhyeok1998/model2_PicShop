const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext("2d");
const colors = document.getElementsByClassName("jsColor");
const range = document.getElementById("jsRange");
const mode = document.getElementById("jsMode");
const saveBtn = document.getElementById("jsSave");
const INITIAL_COLOR = "2c2c2c";
const CANVAS_SIZE = 600;
canvas.width = CANVAS_SIZE;
canvas.height =CANVAS_SIZE;
ctx.fillStyle = "white";
ctx.fillRect(0,0,CANVAS_SIZE,CANVAS_SIZE);
ctx.strokeStyle = INITIAL_COLOR;
ctx.fillStyle = INITIAL_COLOR;
ctx.lineWidth = 2.5;
//fill paint
/*
ctx.fillStyle ="green";
ctx.fillRect(50,20,100,49);
ctx.fillStyle ="purple";
ctx.fillRect(80,100,100,49);
*/
let painting = false;
let filling = false;
function stopPainting(){
painting = false;
}
function startPainting(){
painting = true;
}
function onMouseMove(event){
const x = event.offsetX;
const y = event.offsetY;
if(!painting){
//console.log("creating path in" , x ,y);
ctx.beginPath(); //경로 생성
ctx.moveTo(x, y); //선 시작 좌표
}else{
//console.log("creating line in" , x ,y);
ctx.lineTo(x, y); //선 끝 좌표
ctx.stroke(); //선 그리기
//ctx.closePath(); //현대미술같은 선들..
}
}
function handleColorClick(event){
const color = event.target.style.backgroundColor;
ctx.strokeStyle = color;
ctx.fillStyle = color;
}
function handleRangeChange(event){
const size = event.target.value;
ctx.lineWidth = size;
}
function handleModeClick(){
if(filling ===true){
filling=false;
mode.innerText="FILL";
}else{
filling =true;
mode.innerText="PAINT"
}
}
function handleCanvasClick(){
if(filling){
ctx.fillRect(0,0,CANVAS_SIZE,CANVAS_SIZE);
}
}
function handleCM(event){
event.preventDefault();
}
function handleSaveClick(){
const image = canvas.toDataURL();
const link = document.createElement("a");
link.href=image;
link.download ="PaintJS[🎨]";
link.click();
}
if(canvas){
canvas.addEventListener("mousemove" , onMouseMove);
canvas.addEventListener("mousedown" , startPainting);
canvas.addEventListener("mouseup" , stopPainting);
canvas.addEventListener("mouseleave" , stopPainting);
canvas.addEventListener("click",handleCanvasClick);
canvas.addEventListener("contextmenu",handleCM)
}
Array.from(colors).forEach(color => color.addEventListener("click",handleColorClick));
if(range){
range.addEventListener("input",handleRangeChange);
}
if(mode){
mode.addEventListener("click",handleModeClick);
}
if(saveBtn){
saveBtn.addEventListener("click",handleSaveClick);
}
