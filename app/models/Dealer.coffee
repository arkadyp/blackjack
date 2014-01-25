class window.Dealer extends window.Hand

  dealOut: =>
    #reveal card
    @flip()

  flip: =>
    @models[0].flip()