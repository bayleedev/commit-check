expect = require('chai').expect
Commit = require('../commit.coffee')
subject = null

describe 'Commit', ->

  describe '#correct_format()', ->

    describe 'has the correct format', ->
      beforeEach (done) ->
        subject = new Commit('[VIT-3333] - Destroy the world.')
        done()
      it 'returns true', ->
        expect(subject.correct_format()).to.be.true

    describe 'has incorrect format', ->
      beforeEach (done) ->
        subject = new Commit('Destroy the world.')
        done()
      it 'returns false', ->
        expect(subject.ends_with_period()).to.be.false

  describe '#ends_with_period()', ->

    describe 'without a period', ->
      beforeEach (done) ->
        subject = new Commit('[VIT-3333] - Hello world')
        done()
      it 'returns false', ->
        expect(subject.ends_with_period()).to.be.false

    describe 'with a period', ->
      beforeEach (done) ->
        subject = new Commit('[VIT-3333] - Hello world.')
        done()
      it 'returns true', ->
        expect(subject.ends_with_period()).to.be.true

  describe '#has_pronouns()', ->

    describe 'has no pronouns', ->
      beforeEach (done) ->
        subject = new Commit('[VIT-3333] - Rule the world.')
        done()
      it 'returns false', ->
        expect(subject.has_pronouns()).to.be.false

    describe 'with a period', ->
      beforeEach (done) ->
        subject = new Commit('[VIT-3333] - I ruled the world.')
        done()
      it 'returns true', ->
        expect(subject.has_pronouns()).to.be.true

  describe '#is_present_tense()', ->

    describe 'present tense', ->
      beforeEach (done) ->
        subject = new Commit('[VIT-3333] - Rule the world.')
        done()
      it 'returns true', ->
        expect(subject.is_present_tense()).to.be.true

    describe 'past tense', ->
      beforeEach (done) ->
        subject = new Commit('[VIT-3333] - Ruled the world.')
        done()
      it 'returns false', ->
        expect(subject.is_present_tense()).to.be.false

    describe 'future tense', ->
      beforeEach (done) ->
        subject = new Commit('[VIT-3333] - Will rule the world.')
        done()
      it 'returns false', ->
        expect(subject.is_present_tense()).to.be.false
