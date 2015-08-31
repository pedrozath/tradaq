class Slider
    constructor: (options) ->
        @[key] = value for key, value of options
        @cs = 0
        @slides.first().addClass("current")
        @delay = 5000
        @transition_time = 1
        @play()

        @no_counter = true
        if @counter? then @no_counter = false

        unless @no_counter
            @counter_bullets = @counter.children()
            @counter_bullets.on "click", (e) => 
                @stop()
                @goto $(e.currentTarget).index()
                @play()

    stop: -> clearTimeout @play_timer

    play: ->
        clearTimeout @play_timer
        @play_timer = setTimeout =>
            if @cs < @slides.size()-1
                @goto @cs+1
            else
                @goto 0

            @play()
        , @delay

    goto: (b, a) ->
        a ?= @cs
        @current_slide = @slides.eq(a)
        @new_slide = @slides.eq(b)
        @other_slides = @slides.not(@new_slide)

        TweenMax.to @current_slide, @transition_time,
            className: "+=gone"

        TweenMax.to @new_slide, @transition_time,
            className: "+=current",
            onComplete: =>
                @other_slides.removeClass("current")
                @other_slides.removeClass("gone")

        @cs = b

        unless @no_counter
            @counter_bullets.removeClass("current")
            @counter_bullets.eq(b).addClass("current")

@Slider = Slider