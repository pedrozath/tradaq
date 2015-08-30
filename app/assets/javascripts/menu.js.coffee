class Menu
    constructor: (options) ->
        @[key] = value for key, value of options
        @is_open = false
        @over_elements = 0;

        @toggler.on "mouseenter", => @open() unless @is_open

        @wrapper.on "mouseenter", =>
            clearTimeout @delay_to_close

        @wrapper.on "mouseleave", =>
            @close_with_delay()

    open: ->
        clearTimeout @delay_to_close
        @is_open = true
        for element in @elements
            TweenMax.to element, 0.3, className: "+=open"

    close_with_delay: ->
        clearTimeout @delay_to_close
        @delay_to_close = setTimeout =>
            @close()
        , 200


    close: ->
        @is_open = false
        for element in @elements
            TweenMax.to element, 0.3,
                className: "-=open"

    toggle: -> if @is_open then @close() else @open()

@Menu = Menu