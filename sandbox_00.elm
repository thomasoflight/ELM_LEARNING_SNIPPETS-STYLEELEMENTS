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
    | Title


stylesheet =
    Style.styleSheet
        [ Style.style Title
            [ Color.text Color.blue
            , Font.size 18 -- all units given as px
            ]
        , Style.style None
            []
        ]



-- Element.layout renders the elements as html
-- Every layout requires a stylesheet.


view =
    Element.layout stylesheet <|
        -- An el is the most basic element, like a <div>
        --el Title [ center, width (px 600) ] (text "hello!")
        column None
            []
            [ el Title [] (text "Sandbox 00 - Basic Syntax, Elements")
            , el None [] (text "Hello")
            , el None [] (text "Money Penny")
            , el None [] (text "mousetrap")
            ]


main =
    view
