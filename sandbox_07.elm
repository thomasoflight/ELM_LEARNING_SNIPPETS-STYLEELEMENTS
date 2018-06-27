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
    | BlueFill
    | CoralFillA
    | CoralFillB
    | CoralFillC
    | CoralFillD
    | Title


stylesheet =
    Style.styleSheet
        [ Style.style None
            []
        , Style.style Small
            [ Font.size 14
            , Color.text Color.blue
            , Font.lineHeight 1
            ]
        , Style.style Title
            [ Color.text Color.blue
            , Font.size 30 -- all units given as px
            ]
        , Style.style GrayFill
            [ Color.background Color.lightCharcoal ]
        , Style.style BlueFill
            [ Color.background Color.blue ]
        , Style.style PinkFill
            [ Color.background (Color.rgba 245 80 110 0.7) ]
        , Style.style CoralFillA
            [ Color.background (Color.rgba 251 139 105 0.8) ]
        , Style.style CoralFillB
            [ Color.background (Color.rgba 251 139 105 0.6) ]
        , Style.style CoralFillC
            [ Color.background (Color.rgba 251 139 105 0.4) ]
        , Style.style CoralFillD
            [ Color.background (Color.rgba 251 139 105 0.2) ]
        ]



-- Element.layout renders the elements as html
-- Every layout requires a stylesheet.


view =
    Element.layout stylesheet <|
        -- An el is the most basic element, like a <div>
        --el Title [ center, width (px 600) ] (text "hello!")
        column None
            [ spacing 30, paddingXY 300 20 ]
            [ el Title [] (text "Sandbox 07 - Positioning: Above, Below, etc.")
            , row None
                [ spacing 20, height (px 300) ]
                [ viewBelow
                , viewAbove
                ]
            , row None
                [ spacing 20, height (px 300) ]
                [ viewLeft
                , viewRight
                ]
            ]


viewBelow =
    column None
        [ width (percent 50) ]
        [ el Small [] (text "Below")
        , row None
            []
            [ el GrayFill [ width (px 200), height (px 100) ] empty
                |> below
                    [ viewPinkOptions ]
            ]
        ]


viewAbove =
    column None
        [ width (percent 50) ]
        [ el Small [] (text "Above")
        , el GrayFill [ width (px 200), height (px 100), moveDown 100 ] empty
            |> above
                [ viewPinkOptions
                ]
        ]


viewLeft =
    column None
        [ width (percent 50) ]
        [ el Small [] (text "On Left")
        , el GrayFill [ width (px 200), height (px 100), moveRight 100 ] empty
            |> onLeft
                [ viewPinkOptions
                ]
        ]


viewRight =
    column None
        [ width (percent 50) ]
        [ el Small [] (text "On Right")
        , el GrayFill [ width (px 200), height (px 100) ] empty
            |> onRight
                [ viewPinkOptions
                ]
        ]


viewPinkOptions =
    column None
        [ spacing 10, width (percent 50) ]
        [ el PinkFill [] (text "∆")
        , el PinkFill [] (text "∆")
        , el PinkFill [] (text "∆")
        ]


main =
    view
