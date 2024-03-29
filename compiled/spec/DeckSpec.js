// Generated by CoffeeScript 1.7.1
(function() {
  var assert;

  assert = chai.assert;

  describe('deck', function() {
    var deck, hand;
    deck = null;
    hand = null;
    beforeEach(function() {
      deck = new Deck();
      return hand = deck.dealPlayer();
    });
    describe('hit', function() {
      return it("should give the last card from the deck", function() {
        assert.strictEqual(deck.length, 50);
        assert.strictEqual(deck.last(), hand.hit());
        assert.strictEqual(deck.length, 49);
        hand.playable && (assert.strictEqual(deck.last(), hand.hit()));
        return hand.playable && (assert.strictEqual(deck.length, 48));
      });
    });
    return describe('stand', function() {
      return it("should end turn and finalize your score", function() {
        expect(model.trigger).to.have.been.calledWith('flip', model);
        assert.strictEqual(deck.length, 50);
        assert.strictEqual(deck.last(), hand.hit());
        assert.strictEqual(deck.length, 49);
        hand.playable && (assert.strictEqual(deck.last(), hand.hit()));
        return hand.playable && (assert.strictEqual(deck.length, 48));
      });
    });
  });

}).call(this);

//# sourceMappingURL=DeckSpec.map
