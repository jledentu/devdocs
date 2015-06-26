#= require views/pages/base

class app.views.SailsPage extends app.views.BasePage
  afterRender: ->
    @highlightCode @findAll('pre.highlight-json'), 'javascript'
    @highlightCode @findAll('pre.highlight-javascript'), 'javascript'
    return
