class window.Hand extends Backbone.Collection

  model: Card

  bust: false

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if !@bust
      @add(@deck.pop()).last()
      playerScore = Number($(".player-hand-container").find(".score").text())
      dealerScore = Number($(".dealer-hand-container").find(".score").text())
      if playerScore > 21 then $("h2:first").append "<text style='color:red'> YOU BUSTED </text>"
      if dealerScore > 21 then $("h2:first").append "<text style='color:red'> DEALER BUSTS. YOU WIN! </text>"

  stand: ->
    @models[0].flip()
    do @dealer
    playerScore = Number($(".player-hand-container").find(".score").text())
    dealerScore = Number($(".dealer-hand-container").find(".score").text())
    if !@bust
      if playerScore == dealerScore
        $("h2:first").append "<text style='color:red'> PUSSHSHHHHSHSHHSHS </text>"
      else if playerScore > dealerScore
        $("h2:first").append "<text style='color:red'> PLAYA PLAYA  </text>"

      else $("h2:first").append "<text style='color:red'> DEALER WINS BITCH </text>" if dealerScore > playerScore


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
    if score > 21 then @bust = true
    if hasAce and score + 10 <= 21 then score + 10 else score

  dealer: ->
    do @hit while do @scores < 17

