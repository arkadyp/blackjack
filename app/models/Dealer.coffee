class window.Dealer extends window.Hand

  initialize: (array, @deck, @isDealer) ->
    super(array, @deck, @isDealer)
    @firstCardHidden = true

  dealOut: =>
    #reveal card
    @flip()

    while @score < 17
      @hit()

    @trigger('evaluateOutcome')

  flip: =>
    @firstCardHidden = false
    @models[0].flip()

  getDealerScore: =>
    if @firstCardHidden then @score - @models[0].get('value') else @score
