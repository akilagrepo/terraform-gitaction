const http = require("http");

const server = http.createServer((req, res) => {
  res.end("CI/CD Deployment Successful");
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});