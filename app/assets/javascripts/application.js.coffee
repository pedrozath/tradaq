#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require TweenMax
#= require menu
#= require slider

$ ->
    menu = new Menu
        wrapper: $(".expand")
        elements: $(".expand, .expand *")
        toggler: $(".menu-btn, .area-restrita")

    slider = new Slider
        wrapper: $(".slider")
        slides: $(".slides > *")
        counter: $(".slider .counter")

    # menu.open()

    $(".perguntas h2").on "click", ->
        $(".perguntas > p").slideUp(200)
        $(this).next().slideDown(200)