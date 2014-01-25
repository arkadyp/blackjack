class window.Dealer extends window.Hand

  dealOut: =>
    #reveal card
    @flip()

    while @score < 17
      @hit()

    @trigger('evaluateOutcome')

  flip: =>
    @models[0].flip()