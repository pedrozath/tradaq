class Slider
    constructor: (options) ->
        @[key] = value for key, value of options
        @cs = 0
        @slides.first().addClass("current")
        @delay = 3000
        @transition_time = 1
        @play()
        @counter_bullets = @counter.children()

    play: ->
        setTimeout =>
            if @cs < @slides.size()-1
                @goto @cs+1, @cs
            else
                @goto 0, @cs

            @play()
        , @delay

    goto: (b, a) ->
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

        @counter_bullets.removeClass("current")
        @counter_bullets.eq(b).addClass("current")

@Slider = Slider