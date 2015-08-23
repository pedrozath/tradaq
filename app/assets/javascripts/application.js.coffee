#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require TweenMax

class Menu
    constructor: (options) ->
        @[key] = value for key, value of options
        @is_open = false

    open: ->
        @is_open = true
        for element in @elements
            TweenMax.to element, 0.4, className: "+=open"


    close: ->
        @is_open = false
        for element in @elements
            TweenMax.to element, 0.4,
                className: "-=open"

    toggle: -> if @is_open then @close() else @open()

$ ->
    window.menu = new Menu
        elements: [$(".expand"), $(".expand *")]

    $(".menu-btn").on "click", -> menu.toggle()