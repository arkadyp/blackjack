class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->
    #array -> 2 initial cards
    @score = array[0].get('value') + array[1].get('value');

  hit: -> 
    @add(@deck.pop())
    @updateScore()
    @last()

  updateScore: ->
    #count number of aces in hand
    aceCount = @reduce (memo, card) ->
      memo += if card.get('value') is 1 then 1 else 0
    , 0

    newCardValue = @.models[@.length - 1].get('value')
    @score += newCardValue;

    while(aceCount > 0)
      @score += 10 if @score + 10 <= 21
      aceCount--
    
    @trigger('scoreUpdated')

  getScore: ->
    @score
    

