var MyReporter;

MyReporter = function(runner) {
  var failures, passes;
  passes = 0;
  failures = 0;
  runner.on("pass", function(test) {
    passes++;
    process.stdout.write(".");
  });
  runner.on("fail", function(test, err) {
    failures++;
    process.stdout.write("F");
  });
  return runner.on("end", function() {
    console.log();
    console.log("end: %d/%d", passes, passes + failures);
    process.exit(failures);
  });
};

module.exports = MyReporter;
