var http = require('http');
var static = require('node-static');
var file = new static.Server('.');

http.createServer(function(req, res) {
  
  if (!/.js|.css$/i.test(req.url))
    req.url = '/src/index.html';
  file.serve(req, res);
  console.log('req.url='+req.url);
  //console.log('res='+res);
}).listen(8080);

console.log('Server running on port 8080');