#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get("playerHand").on "reset", @startOver, @
    @get("dealerHand").on "reset", @startOver, @


  startOver: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @trigger 'reset', @
    $("body").html ""
    new AppView(model: new App()).$el.appendTo 'body'

