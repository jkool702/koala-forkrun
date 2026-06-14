#!/usr/bin/node

// Handle EPIPE errors when downstream processes close early (e.g., head -n)
process.stdout.on('error', function(err) {
    if (err.code === 'EPIPE') process.exit(0);
});

var readline = require('readline');
var natural = require('natural');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

rl.on('line', function (line) {
  //console.log(natural.PorterStemmer.stem(line));
  console.log(natural.LancasterStemmer.stem(line));
});

rl.on('close', function () {
    process.exit(0);
})
