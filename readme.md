## Example Usage
~~~
-> % coffee index.coffee '[VIT-3333] - Destroyed the world.'
    Invalid format { reason: 'Needs to be present tense',
      title: '[VIT-3333] - Destroyed the world.' }
~~~

## Setup a git hook
~~~
git clone git@github.com:blainesch/commit-check.git ~/commit
cp ~/commit/.commit-msg .git/hooks/
~~~
