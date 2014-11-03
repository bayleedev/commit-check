## Example Usage
~~~
-> % coffee index.coffee '[VIT-3333] - Destroyed the world.'
    Invalid format { reason: 'Needs to be present tense',
      title: '[VIT-3333] - Destroyed the world.' }
~~~

## Setup a git hook
~~~
git clone git@github.com:blainesch/commit-check.git ~/commit
rm .git/hooks/commit-msg
cp ~/commit/commit-msg .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg
~~~

## Run Tests
~~~
mocha --reporter=mocha-pride --compilers coffee:coffee-script/register ./spec
~~~
