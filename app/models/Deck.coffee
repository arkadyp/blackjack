class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> playerHand = new Player [ @pop(), @pop() ], @

  dealDealer: -> new Dealer [ @pop().flip(), @pop() ], @, true
