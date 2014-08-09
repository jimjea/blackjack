#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  @.model.on 'reset', (() ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    ), this




# WE NEED TO TRIGGER 'RESET' FROM HAND.COFFEE BASED ON A LISTENER IN APPVIEW.COFFEE
# NEED TO REPLACE App.Deck.on with correct context
