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

    depoimentos = new Slider
        wrapper: $(".depoimentos")
        slides: $(".depoimentos .depoimento")

    $(".perguntas h2").on "click", ->
        $(".perguntas > p").slideUp(200)
        $(this).next().slideDown(200)

    $("form.area-restrita").on "keyup", (e) ->
        if e.which is 13
            $(e.currentTarget).submit()