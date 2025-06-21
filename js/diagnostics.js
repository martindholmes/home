/* This is a very simple file designed to make the diagnostics 
 * output page a little slicker. Nothing in this file should
 * be necessary. */
 
var diagnosticsJSON = null;
var canvas          = null;
var ctx             = null;
var lineChart       = null;
 
function setup(){
  var links = document.querySelectorAll('section>h2>a'), i, imax, id, request, promise;
  for (i=0, imax=links.length; i<imax; i++){
    links[i].removeAttribute('href');
    links[i].setAttribute('onclick', "showHideSection(this)");
  }
  
//We may not need this version of the JSON, but it may be handy.
/* 
   try{
    request = new Request('js/diagnostics.json');
    fetch(request).then(
      function(response){
        try{
          diagnosticsJSON = JSON.parse(response);
          console.log('Retrieved JSON stats.');
        }
        catch(e){
          console.log('Unable to parse JSON.');
        }
      },
      function(reject){
        console.log('Error retrieving some JSON.');
      }
    );
  }
  catch(e){
    console.log('Error retrieving some JSON.');
  }
   */  
//Set up the charts.
  canvas = document.getElementById('canvas');
  if (canvas !== null && typeof canvas !== 'undefined'){
    ctx = canvas.getContext('2d');
    if (ctx !== null && typeof ctx !== 'undefined'){
      lineChart = new Chart(ctx, config);
    }
  }
  
  
  
//Open a target diagnostic if there is one.
  if (document.location.hash !== ''){
    let targId = document.location.hash.substring(1);
    console.log(targId);
    let targ = document.getElementById(targId);
    if (targ){
      openAncestors(targ);
    }
  }
}   

function openAncestors(node){
  let current = node;
  while (current){
    if (current.nodeName.toUpperCase() === 'DETAILS'){
      current.setAttribute('open', 'open');
    }
    current = current.parentNode;
  }
}


 
function showHideSection(sender){
 var currHash = window.location.hash.substring(1);
 console.log(currHash);
 var id = sender.parentNode.parentNode.id;
 if (currHash === id){
   window.location.hash = '#/';
 }
 else{
   window.location.hash = '#' + id;
 }
}

window.addEventListener('load', setup);
      
