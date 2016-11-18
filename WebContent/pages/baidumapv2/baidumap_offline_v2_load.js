var bdmapcfg = {
  'imgext':'.png', 
  'tiles_dir':'tiles'   
};

var scripts = document.getElementsByTagName("script");
var JS__FILE__ = scripts[scripts.length - 1].getAttribute("src");
bdmapcfg.home = JS__FILE__.substr(0, JS__FILE__.lastIndexOf("/")+1); 
bdmapcfg.picture = "http://"+IP+":8080/pictures/";
(function(){
  window.BMap_loadScriptTime = (new Date).getTime();
  
  document.write('<script type="text/javascript" src="'+bdmapcfg.home+'baidumap_offline_v2_20160822.js"></script>');
})();