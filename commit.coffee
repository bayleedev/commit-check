nlp = require("nlp_compromise")

class Commit

  TITLE_FORMAT: /\[([a-z]{3}\-[0-9]{4,5})\] ?\- ?(.*)\.?/i

  constructor: (title) ->
    @title = title

  is_valid: ->
    @correct_format() and not @has_pronouns() and
      @is_present_tense() and @ends_with_period()

  invalid_why: ->
    reason = "Needs to match the regex: #{@TITLE_FORMAT}" unless @correct_format()
    reason = 'It has pronouns' if @has_pronouns()
    reason = 'Needs to be present tense' unless @is_present_tense()
    reason = 'Needs to end with a period' unless @ends_with_period()
    {reason, @title}

  ends_with_period: ->
    @sentense().substr(-1, 1) is '.'

  correct_format: ->
    !!@title.match @TITLE_FORMAT

  has_pronouns: ->
    pronoun_tags = ['PRP', 'PP']
    for word in @tokens()
      if pronoun_tags.indexOf(word.pos.tag) isnt -1
        return true
    false

  tokens: ->
    nlp.pos(@sentense())[0].tokens

  # @hack
  # Could be undefined if the verb is seen
  # as the noun e.g. 'Implement'
  is_present_tense: ->
    @tense() == 'present' or @tense() is undefined

  tense: ->
    nlp.pos(@sentense())[0].tense()[0]

  sentense: ->
    @title.match(@TITLE_FORMAT)?[2] or ''

  ticket: ->
    @title.match(@TITLE_FORMAT)?[1] or ''

module.exports = Commit
