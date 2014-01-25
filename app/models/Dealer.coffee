class window.Dealer extends window.Hand

  dealOut: =>
    #reveal card
    @models[0].flip()