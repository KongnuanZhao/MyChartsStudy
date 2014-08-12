        var tablink_idname = new Array("tablink","anotherlink")
var tabcontent_idname = new Array("tabcontent","anothercontent") 
var tabcount = new Array("8","8")
var loadtabs = new Array("1","1")  
var autochangemenu = 1;
var changespeed = 0;
var stoponhover = 0;

function easytabs(menunr, active) {if (menunr == autochangemenu){
	currenttab=active;}if ((menunr == autochangemenu)&&(stoponhover==1)) 
	{stop_autochange()} else if ((menunr == autochangemenu)&&(stoponhover==0)) 
	{counter=0;} menunr = menunr-1;
	for (i=1; i <= tabcount[menunr]; i++)
	{
		document.getElementById(tablink_idname[menunr]+i).className='tab'+i;
	document.getElementById(tabcontent_idname[menunr]+i).style.display = 'none';}
	document.getElementById(tablink_idname[menunr]+active).className='tab'+active+' tabactive';
	document.getElementById(tabcontent_idname[menunr]+active).style.display = 'block';}


window.onload=function(){
	var menucount=loadtabs.length;
	var a = 0; var b = 1; 
	do {easytabs(b, loadtabs[a]);
	a++; b++;}while (b<=menucount);
	}