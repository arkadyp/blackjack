class window.Player extends window.Hand

  initialize: (array, @deck, @isDealer) ->
    super(array, @deck, @isDealer)
    @cashAmount = 100
    @betAmount = 0
    @result = 'pending'


  checkBust: ->
    if @score > 21
      @betAmount = 0;
      @trigger('bust')
      @result = 'lose'
      @trigger('resultChanged')


  evaluateOutcome: (dealerScore) =>
    if @score > dealerScore or dealerScore > 21
      @cashAmount += @betAmount
      @result = 'win'
    else if @score is dealerScore
      @betAmount = 0
      @result = 'tie'
    else
      @betAmount = 0
      @result = 'lose'
    @trigger('resultChanged')

  getResult: ->
    @result