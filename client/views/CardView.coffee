class window.CardView extends Backbone.View

  className: 'card'

  templateUp: _.template '<% if (this.model.get("revealed")) { %> <img style = "max-width:100%; max-height:100%;" src = "img/cards/<%= rankName %>-<%= suitName %>.png" /> <% } else { %> <img style = "max-width:100%; max-height:100%;" src = "img/card-back.png" /> <% } %>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @templateUp @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
