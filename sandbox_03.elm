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
    | PinkFill
    | CoralFill
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
        , Style.style PinkFill
            [ Color.background (Color.rgba 245 80 110 0.7) ]
        , Style.style CoralFill
            [ Color.background (Color.rgba 251 139 105 0.8) ]
        ]



-- Element.layout renders the elements as html
-- Every layout requires a stylesheet.


view =
    Element.layout stylesheet <|
        -- An el is the most basic element, like a <div>
        --el Title [ center, width (px 600) ] (text "hello!")
        column None
            [ spacing 10 ]
            [ el Title [] (text "Sandbox 03 - Height/Width, Formats")
            , el Small [] (text "height and width : `fill`")
            , el GrayFill [ height fill, width fill ] (text "Hello")
            , el Small [] (text "height : 100%, width 50%")
            , el GrayFill [ height (percent 100), width (percent 50) ] (text "Money Penny")
            , el Small [] (text "height and width : 100%")
            , el GrayFill [ height (percent 100), width (percent 100) ] (text "Mousetrap")
            , row PinkFill
                [ spacing 10 ]
                [ el GrayFill [ height (px 50), width (percent 40) ] (text "box")
                , el GrayFill [ width (percent 20) ] (text "box")
                , el GrayFill [ width (percent 40) ] (text "box")
                ]
            , row CoralFill
                [ spacing 20 ]
                [ el GrayFill [ height (px 100), width (percent 40) ] (text "box")
                , el GrayFill [ width (percent 20) ] (text "box")
                , el GrayFill [ width (percent 40) ] (text "box")
                ]
            ]


main =
    view
