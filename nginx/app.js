
var app = express();

app.route('*').all(function(req, res) {
  res.send('NGINX: Hello World!');
});

app.listen(2000)
