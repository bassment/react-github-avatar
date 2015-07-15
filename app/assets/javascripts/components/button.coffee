@Button = React.createClass
  localHandleClick: ->
    @props.localHandleClick(@props.increment)

  render: ->
      React.DOM.button
        onClick: @localHandleClick
        "+ #{@props.increment}"

@Result = React.createClass
  render: ->
    React.DOM.div null,
      @props.localCounter

@Counter = React.createClass
  getInitialState: ->
    counter: 0

  handleClick: (increment) ->
    @setState
      counter: @state.counter + increment

  render: ->
    React.DOM.div null,
      React.createElement Button, localHandleClick: @handleClick, increment: 1
      React.createElement Button, localHandleClick: @handleClick, increment: 5
      React.createElement Button, localHandleClick: @handleClick, increment: 10
      React.createElement Button, localHandleClick: @handleClick, increment: 100
      React.createElement Result, localCounter: @state.counter