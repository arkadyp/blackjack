class window.Player extends window.Hand

  initialize: (array, @deck, @isDealer) ->
    super(array, @deck, @isDealer)
    @result = 'pending'


  checkBust: ->
    if @score > 21
      @trigger('bust')
      @result = 'lose'
      @trigger('resultChanged')


  evaluateOutcome: (dealerScore) =>
    @result = if @score > dealerScore or dealerScore > 21 then 'win' else 'lose'
    @trigger('resultChanged')

  getResult: ->
    @result