class window.Dealer extends window.Hand

  dealOut: =>
    #reveal card
    @flip()

    while @score < 17
      @hit()
      console.log @score

  flip: =>
    @models[0].flip()