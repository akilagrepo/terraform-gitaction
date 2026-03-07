const http = require("http");

const server = http.createServer((req, res) => {
  res.end("CI/CD Deployment Successful Akila Pradeep");
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});