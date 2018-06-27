module Main exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font


type MyStyles
    = None
    | Small
    | GrayFill
    | Title


stylesheet =
    Style.styleSheet
        [ Style.style None
            []
        , Style.style Small
            [ Font.size 10
            , Color.text Color.darkCharcoal
            , Font.lineHeight 1
            ]
        , Style.style Title
            [ Color.text Color.blue
            , Font.size 18 -- all units given as px
            ]
        , Style.style GrayFill
            [ Color.background Color.lightCharcoal ]
        ]



-- Element.layout renders the elements as html
-- Every layout requires a stylesheet.


view =
    Element.layout stylesheet <|
        -- An el is the most basic element, like a <div>
        --el Title [ center, width (px 600) ] (text "hello!")
        column None
            [ spacing 10 ]
            [ el Title [] (text "Sandbox 02 - Height/Width Attributes")
            , el Small [] (text "20 pixel height")
            , el GrayFill [ height (px 20) ] (text "Hello")
            , el Small [] (text "40 pixel height")
            , el GrayFill [ height (px 40) ] (text "Money Penny")
            , el Small [] (text "60 pixel height")
            , el GrayFill [ height (px 60) ] (text "Mousetrap")
            , el Small [] (text "60 pixel height + 80 pixel width")
            , el GrayFill [ height (px 60), width (px 80) ] (text "Mousetrap")
            ]


main =
    view
