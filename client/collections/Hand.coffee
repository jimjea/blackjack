class window.Hand extends Backbone.Collection

  model: Card

  bust: false

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    if @bust then @trigger "reset", this
    # console.log @.deck
    # @model.set(@deck, new Deck)

  stand: ->
    @models[0].flip()
    do @dealer


  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if score > 21 then @bust = !@bust
    if hasAce and score + 10 <= 21 then score + 10 else score

  dealer: ->
    do @hit while do @scores < 17


