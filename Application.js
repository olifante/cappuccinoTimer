var baseURL=new CFURL(".",ObjectiveJ.pageURL),URLCache={},CFHTTPRequest_open=CFHTTPRequest.prototype.open;CFHTTPRequest.prototype.open=function(b,a){var c=CFHTTPRequest._lookupCachedRequest(a);if(c){var d=this;this._nativeRequest=c;this._nativeRequest.onreadystatechange=function(){ObjectiveJ.determineAndDispatchHTTPRequestEvents(d)}}return CFHTTPRequest_open.apply(this,arguments)};CFHTTPRequest._cacheRequest=function(b,a,c,d){URLCache[b]=new MockXMLHttpRequest(a,c,d)};
CFHTTPRequest._lookupCachedRequest=function(b){return URLCache[b]};function MockXMLHttpRequest(b,a,c){this.readyState=CFHTTPRequest.UninitializedState;this.status=b||200;this.statusText="";this.responseText=c||"";this._responseHeaders=a||{}}MockXMLHttpRequest.prototype.open=function(b,a,c){this.readyState=CFHTTPRequest.LoadingState;this.async=c};
MockXMLHttpRequest.prototype.send=function(){function b(){for(a.readyState=CFHTTPRequest.LoadedState;a.readyState<=CFHTTPRequest.CompleteState;a.readyState++)a.onreadystatechange()}var a=this;a.responseText=a.responseText.toString();(a.async?ObjectiveJ.Asynchronous(b):b)()};MockXMLHttpRequest.prototype.onreadystatechange=function(){};MockXMLHttpRequest.prototype.abort=function(){};MockXMLHttpRequest.prototype.setRequestHeader=function(){};MockXMLHttpRequest.prototype.getAllResponseHeaders=function(){return this._responseHeaders};
MockXMLHttpRequest.prototype.getResponseHeader=function(b){return this._responseHeaders[b]};MockXMLHttpRequest.prototype.overrideMimeType=function(){};for(var appFilesCount=3,i=1;i<=appFilesCount;i++){var script=document.createElement("script");script.src="Application"+i+".js";script.charset="UTF-8";script.onload=function(){--appFilesCount===0&&ObjectiveJ.bootstrap()};document.getElementsByTagName("head")[0].appendChild(script)};