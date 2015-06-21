@Card = React.createClass

    getInitialState:->
        return {}
        
    componentDidMount: ->
        component = this
        $.get "https://api.github.com/users/" + @props.login, (data) ->
            component.setState(data)
    
    render: ->
        React.DOM.div null,
            React.DOM.img
                src: @state.avatar_url
                width: 80
            React.DOM.h3 null,
                @state.name
            React.DOM.hr null
            
@Form = React.createClass

    handleSubmit: (e) ->
        e.preventDefault()
        loginInput = React.findDOMNode(@refs.login)
        @props.addCardInfo(loginInput.value)
        loginInput.value = ''
        

    render: ->
        React.DOM.form
            key: @refs.login
            onSubmit: @handleSubmit
            React.DOM.input
                placeholder: "github login"
                ref: "login"
            React.DOM.button null,
                'Add'
    
    
@Avatar = React.createClass

    getInitialState: ->
        logins: []
        
    addCard: (loginToAdd) ->
        logins = @state.logins.slice()
        logins.push loginToAdd
        @setState logins: logins

    render: ->
        cards = @state.logins.map (login, i) ->
            React.createElement Card, login: login, key: i
        React.DOM.div null,
            React.createElement Form, addCardInfo: @addCard
            cards