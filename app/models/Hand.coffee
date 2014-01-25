class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->
    #array -> 2 initial cards that go into model
    card1 = array[0].get('value')
    card2 = array[1].get('value')
    @score = card1 + card2
    hasAce = if card1 is 1 or card2 is 1 then true else false
    if hasAce and @score + 10 <= 21
      @score += 10
    @score


  hit: -> 
    @add(@deck.pop())
    @updateScore()
    @last()

  updateScore: ->
    #count number of aces in hand
    newCard = @.models[@.length - 1].get('value')
    @hasAce = true if newCard is 1
    @score += newCard
    
    #check for ace adjustment
    if @hasAce and @score + 10 <= 21
      @score += 10
    @score

    @trigger('scoreUpdated')

  getScore: ->
    @score


