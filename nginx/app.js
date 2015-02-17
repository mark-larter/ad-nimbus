
var app = express();

app.route('*').all(function(req, res) {
  res.send('Hello World!');
});

app.listen(2000)
