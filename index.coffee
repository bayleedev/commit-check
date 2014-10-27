Commit = require('./commit.coffee')
commit = new Commit(process.argv.pop())
if commit.is_valid()
  process.exit(0)
else
  console.log 'Invalid format', commit.invalid_why()
  process.exit(1)
