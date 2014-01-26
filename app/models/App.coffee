#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'bust', => 
      @get('dealerHand').flip()

    @get('playerHand').on 'stand', => 
      @get('dealerHand').dealOut()

    @get('dealerHand').on 'evaluateOutcome', =>
      dealerScore = @get('dealerHand').getScore()
      @get('playerHand').evaluateOutcome(dealerScore)

    @get('playerHand').on 'placeBet', =>
      @trigger('dealCards')
