class window.Player extends window.Hand

  initialize: (array, @deck, @isDealer) ->
    super(array, @deck, @isDealer)
    @cashAmount = 100
    @betAmount = 0
    @result = 'pending'


  checkBust: ->
    if @score > 21
      @betAmount = 0
      @result = 'lose'
      @trigger('resultChanged')


  evaluateOutcome: (dealerScore) =>
    if @score > dealerScore or dealerScore > 21
      @cashAmount += @betAmount * 2
      @result = 'win'
    else if @score is dealerScore
      @cashAmount += @betAmount
      @result = 'tie'
    else
      @result = 'lose'
    
    @betAmount = 0
    @trigger('resultChanged')

  getResult: ->
    @result