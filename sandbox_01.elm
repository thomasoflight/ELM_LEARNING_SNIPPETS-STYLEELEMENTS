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
    | GrayFill
    | Title


stylesheet =
    Style.styleSheet
        [ Style.style None
            []
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
            [ el Title [] (text "Sandbox 01 - Basic Syntax, Styles")
            , el None [ height (px 20) ] empty
            , el GrayFill [ height (px 20) ] (text "Hello - set into a 20 pixel height")
            , el GrayFill [ height (px 40) ] (text "Money Penny - set into a 40 pixel height")
            , el GrayFill [ height (px 60) ] (text "mousetrap - set ... 60 pixel height")
            ]


main =
    view
