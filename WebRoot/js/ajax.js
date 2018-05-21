/**
 * @author talent
 */
var util = {
	G: function(id){return id.nodeType==1?id:document.getElementById(id);},
	A: function(arg){var a = new Array(arg.length); var i=arg.length-1;while(i>=0){ a[i]=arg[i]; i--} return a;},
	ext:function(s,d){for(var k in s) d[k]=s[k]; return d;},
	 _trim: function(str){return str.replace(/(^[\s\t\xa0\u3000]+)|([\u3000\xa0\s\t]+$)/g, "")},
	rc: function(e, c){
		if(!e) return;
		var t = util._trim, r = new RegExp("(^|\\s{1,})" + t(c) + "(\\s{1,}|$)", "g");
		e.className = t(e.className.replace(r, "$2"));
	},
	ac: function(e, c){
		if(!e) return;
		var a = e.className.split(" "), t = util._trim;
		if(!new RegExp("(^|\\s{1,})" + t(c) + "(\\s{1,}|$)").test(e.className))
			e.className = t(a.concat(c).join(" "));
	},
	hc:function(e,c){return e.className.indexOf(c)==-1?false:true;},
	each: function(d, fun){
		if(d.length||d.length==0) for(var i=0,l=d.length;i<l;i++)fun(d[i],i);
		else if(typeof d=="object") for(var k in d) fun(k,d[k]);
	},
	format:function (str, obj){
		return str.replace(/\{\s*(\w+)\s*\}/g, function(m, i){
			return typeof obj[i]=="undefined"?"":obj[i];
		});
	},
	up:function (e,tag){
		var p=e.parentNode; if(tag=="body") return document.body;
		while(p.tagName!=tag.toUpperCase()){p=p.parentNode; if(p.tagName=="BODY") return null;}
		return p;
	},
	childs:function(e){
		var c=e.childNodes,re=[];
		util.each(c,function(d){if(d.nodeType==1) re.push(d);});
		return re;
	},
	get:function(e){
		var valueT = 0, valueL = 0;
		do {
			valueT += e.offsetTop  || 0;
			valueL += e.offsetLeft || 0;
			e = e.offsetParent;
		} while (e);
		return {top: valueT, left: valueL};
	},
	cut: function(value, byteLength, prefix){
		var newvalue = value.replace(/[^\x00-\xff]/g, "**");
       	var length = newvalue.length;
		var limitDate = newvalue.substr(0, byteLength);
      	var count = size = 0; var limitvalue = "";
		for (var i = 0; i < limitDate.length; i++) {
			var flat = limitDate.substr(i, 1);
			if (flat == "*") count++;
		 }
		 var istar = newvalue.substr(byteLength * 1 - 1, 1);
		 size = (count%2==0?count:count-1)/ 2 + (byteLength * 1 - count);
		 limitvalue = value.substr(0, size);
		return limitvalue+(prefix||"");
	},
	_h: function(){return document.documentElement.clientHeight;}, 
	_w: function(){return document.documentElement.clientWidth;},
	len: function(str){
		  var cnt = 0;
  		  for( i=0; i<str.length; i++) {
			  var value = str.charCodeAt(i);
			  if( value < 0x080) cnt += 1;
     		  else if( value < 0x0800) cnt += 2;
      		  else  cnt += 3;
   	 	  }
          return cnt;
	},
	insert: function(ele, data){
		while(ele.childNodes.length > 0){
			ele.removeChild(ele.childNodes[0]);}
		if(data=="") return "";
		var o=document.createElement("div"),ol;
	    o.innerHTML="<table>"+data+"</table>";
	    ol=o.childNodes[0].tBodies[0].rows;
	    while(ol.length>0){
	        ele.appendChild(ol[0]);
	    }
	},
	gT:function(e, tag){return e.getElementsByTagName(tag);},
	isChinese:function(e){
		return e.value.match(/^[\u4e00-\u9fa5]+$/)?true:false;
	},
	tag:function(eles, c){
		var showing = null, c=c||"";
		for(var k in eles){
			var t = util.G(k); t.targ = eles[k], targ = util.G(eles[k]);
			showing = showing||t ,targ.style.display = "none";
			util.G(k).onclick = function(event){
				event = event||window.event;
				var target = event.target||event.srcElement;
				if(showing==target){
					util.G(target.targ).style.display = "none";
					util.rc(target,c); return "";
				}
				util.rc(showing,c), util.ac(target, c); 
				util.G(showing.targ).style.display = "none";
				util.G(target.targ).style.display = "";
				showing = target;
			};
		}
		util.ac(util.G(showing), c); 
		util.G(showing.targ).style.display = "";
	}
};
util.ext({
	bind:function(){
		var __method = this, args = util.A(arguments), object = args.shift();
		return function() {
		  return __method.apply(object, args.concat(util.A(arguments)));
		}
	}
}, Function.prototype);
util.ext({
	setOpacity: function(e, value) {
    	e = util.G(e); var style = e.style;
		if(document.all){
    		if (value < 0.00001) value = 0;
    		style.filter = 'alpha(opacity=' + (value * 100) + ')';
		}else
			style.opacity = (value == 1 || value === '') ? 1 :
     								 (value < 0.00001) ? 0 : value;
	},
	getOpacity:function(e){
		e = util.G(e); var o = (document.all&&e.filters.alpha&&e.filters.alpha.opacity/100);
		if(o==0) return 0; o = e.currentStyle.opacity; if(o==0) return o; return o||1;
	},
	bVersion:function(){
		if(navigator&&navigator.appName =="Microsoft Internet Explorer")  
			  return parseInt(navigator.appVersion.split(" ")[3]);
		return 9999;
	},
	gV:function(e){
		if(!e.value) return "";
		return util.trim(e.value);
	}
},util);
util.ext({
	mask: null, de:  null, bd: null, h:0, w:0, sh:0, target:null,
	popW: function(flag){
		if(!util.target) return ""; flag = flag||0;
		util.bd = document.body; util.de = document.documentElement;
		if(!util.mask){
			util.mask = document.createElement("div");
			util.mask.style.position = "absolute";
			util.mask.top = 0; util.mask.left=0; util.mask.style.zIndex = 100;
			util.mask.style.backgroundColor = "#999";
			util.setOpacity(util.mask, 0.8);
			util.bd.insertBefore(util.mask, util.bd.firstChild);
		}else util.mask.style.display="";
		util.de.style.overflow = "hidden";
		util.hw(); util.target.style.display = "block";
		util.target.style.top =(util.de.clientHeight-util.target.offsetHeight)/2+util.sh+"px"; 
		util.target.style.left = (util.w-util.target.offsetWidth)/2+"px";
		if(flag==0) util.popevent();
	},
	hideW:function(){
		window.onresize =function(){};
		util.de.style.overflow = ""; 
		util.mask&&(util.mask.style.display="none"); 
		util.target&&(util.target.style.display="none");
	},
	popevent:function(){
		if(!util.target) return "";
		window.onresize =function(){ util.popW(1); };
	},
	hw:function(){
		util.h = util.bd.clientHeight; util.w = util.bd.clientWidth; util.sh = util.de.scrollTop;
		util.mask.style.width=util.w+"px"; util.mask.style.height="600px";
	}
}, util);
function ckIsChinese(id){
	if(!util.G(id)) return ""; var valid = true;
	util.each(util.gT(util.G(id),"input"),function(i){
		if(i.getAttribute("rel")=="chinese"&&!util.isChinese(i)){
			valid = false; onfail("�Բ���������������ƣ�");
		}
	});
	return valid;
}
var AjaxRequest = function(url, options){
	this.url = url;
	this.options = {
		parameters: {},
		async: true,
		contentType:  'application/x-www-form-urlencoded',
		method: 	'post',
		encoding:   'UTF-8',
		onexecute: function(){},
		onsuccess: function(){},
		onfailure: function(){},
		onerror: function(){}
	};
	this.Extend(options, this.options);
	this.options.method = this.options.method.toUpperCase();
	this.parameters = this.createQuery(this.options.parameters);
	if(!window.XMLHttpRequest && window.ActiveXObject){
    	this.loader = function(){
	        for(var i = 0, a = ['MSXML3', 'MSXML2', 'Microsoft']; i < a.length; i ++)
	            try{
	                return new ActiveXObject(a[i] + '.XMLHTTP');
	            }catch(ex){}
    	}();
	}else this.loader = new XMLHttpRequest();
	this.request.call(this);
}
AjaxRequest.prototype = {
	type: /(text|application)\/(x-)?(\S+)/i,
	
	Extend: function(source, dest){
		for(var key in source) dest[key] = source[key];
	},
	
	request: function(){
		var o = this.options, self = this;
		o.method == "POST" || o.method == "GET" || (o.method = "POST");
		if(o.method=='GET'&& self.parameters !== "")
			self.url = ((self.url.match(/\?/))?self.url:(self.url+"?"))+self.parameters;
		else if (/Konqueror|Safari|KHTML/.test(navigator.userAgent))
        	this.parameters += '&_=';
		try {
			o.onexecute();
			this.loader.open(o.method, this.url, o.async);
			this.loader.onreadystatechange = function(){
				self.onStateChange.call(self)
			};
			this.setHeader.call(this);
			this.sendBody = o.method == 'GET' ? null : this.parameters;
			this.loader.send(this.sendBody);
			if (!this.options.async && this.loader.overrideMimeType) 
				this.onStateChange();
		} 
		catch (e) {	o.onerror();}
	},
	
	setHeader: function(){
		var o = this.options, self = this;
		var headers = {
      		'X-Requested-With': 'XMLHttpRequest',
      		'Accept': 'text/javascript, text/html, application/xml, text/xml, */*'
    	};
		if (o.method == 'POST') {
      		headers['Content-type'] = o.contentType + (o.encoding ? '; charset=' + o.encoding : '');
			if (this.loader.overrideMimeType && (navigator.userAgent.match(/Gecko\/(\d{4})/) || [0,2005])[1] < 2005)
            	headers['Connection'] = 'close';
		}
		for(var key in headers) self.loader.setRequestHeader(key, headers[key]);
	},
	
	onStateChange: function(){
		var o = this.options, readyState = this.loader.readyState;
		if(readyState == 4){
			var status = this.loader.status || 0;
			var isSuc = (status >= 200&&status < 300)?true:false;
			if(isSuc) this.getResponse.call(this);
			else o.onfailure();
			this.loader.onreadystatechange = function(){};
		}
	},
	
	getResponse: function(){
		var contentType = this.loader.getResponseHeader('Content-type') || "";
		var dataType = contentType.match(this.type), data = "";
		if(dataType && (dataType = dataType[3])) 
			data = dataType.match(/script/i)?"javascript":(dataType.match(/xml/i)?"xml":"");
		this.options.onsuccess(this.loader, data);
	},
	
	createQuery: function(){
		var o = this.options.parameters, result = "";
		for(var key in o) result += "&"+key + "=" + o[key];
		result = result.replace(/^&/,"");
		return result;
	}
};
var flag = 0;
function hover(c){
	if(flag==1) return "";
	c = c||"hover";
	 var trs = document.getElementsByTagName("tr");
	 var results = [];
	 for(var i=0,l=trs.length; i<l;i++){
		 if(trs[i].getAttribute("rel")=="tablerows")
		 results.push(trs[i]);
	 }
	 for(var i=0,l=results.length;i<l;i++){
		 results[i].onmouseover = function(event){
			 event = event||window.event;
			 var target = event.target||event.srcElement;
			 if(target.tagName != "TD" && target.tagName != "A") return "";
			 var p = target.parentNode;
			 while(p.tagName != "TR" && p.tagName != "BODY")
				p = p.parentNode;
			 if(p.tagName == "TR") util.ac(p,c);
		 };
		 results[i].onmouseout = function(event){
			 event = event||window.event;
			 var target = event.target||event.srcElement;
			 if(target.tagName != "TD" && target.tagName != "A") return "";
			 var p = target.parentNode;
			 while(p.tagName != "TR" && p.tagName != "BODY")
				p = p.parentNode;
			 if(p.tagName == "TR") util.rc(p,c);
		 };
	 }
	 flag = 1;
}
//hover();
//if(typeof display=="undefined") var display = 0;
//if(display==0)
//	document.write("<script type='text/javascript' src='"+path+"/js/pushMail.js'></script>");