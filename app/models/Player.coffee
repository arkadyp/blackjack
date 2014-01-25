class window.Player extends window.Hand

  initialize: (array, @deck, @isDealer) ->
    super(array, @deck, @isDealer)
    @cashAmount = 100
    @betAmount = 0
    @result = 'pending'


  checkBust: ->
    if @score > 21
      @trigger('bust')
      @result = 'lose'
      @trigger('resultChanged')


  evaluateOutcome: (dealerScore) =>
    if @score > dealerScore or dealerScore > 21
      @result = 'win'
    else if @score is dealerScore
      @result = 'tie'
    else
      @result = 'lose'
    @trigger('resultChanged')

  getResult: ->
    @result