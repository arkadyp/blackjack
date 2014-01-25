class window.CardView extends Backbone.View

  className: 'card'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
      
    #render card image
    rankName = @model.attributes.rankName
    suitName = @model.attributes.suitName
    @$el.css({'background-image':"url(\"cards/#{rankName}-#{suitName}.png\")"})

    unless @model.get 'revealed'
      @$el.css({'background-image':"url(\"cards/card-back.png\")"})
      @$el.addClass 'covered' 
