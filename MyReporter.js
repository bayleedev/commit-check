var MyReporter;
var colors = require('colors/safe');

MyReporter = function(runner) {
  var failures, passes;
  var rainbow = ['red', 'yellow', 'green', 'blue', 'magenta'];
  var total = 0;
  var passes = 0;
  var failures = 0;
  var errors = [];
  runner.on("pass", function(test) {
    color = rainbow[total % rainbow.length];
    process.stdout.write(colors.bold[color]('.'));
    passes++;
    total++;
  });
  runner.on("fail", function(test, err) {
    process.stdout.write(colors.red('F'));
    errors.push({
      title: test.fullTitle(),
      message: err.message
    });
    total++;
    failures++;
  });
  return runner.on("end", function() {
    console.log();
    for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
      console.log(
        colors.red('Error: '),
        colors.white(errors[i].title),
        colors.white(errors[i].message)
      );
    }
    console.log("end: %d/%d", passes, passes + failures);
    process.exit(failures);
  });
};

module.exports = MyReporter;
