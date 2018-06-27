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
        --column BlueFill [ width fill, alignRight ] [ el BlueFill [] (text "test") ]
        el None [ width (px 500), center ]
        <|
            column None
                [ spacing 30, paddingXY 20 20, width fill ]
                [ el Title [] (text "Sandbox 08 - Positioning: Within and Screen")
                , screen <|
                    viewScreenOptions
                , row CoralFillD
                    [ spacing 20, height (px 300) ]
                    [ viewWithin
                    ]
                , row CoralFillD
                    [ spacing 20, height (px 300), width fill ]
                    [ viewScreen
                    ]
                ]


viewWithin =
    column BlueFill
        [ width (percent 50), center ]
        [ el Small [] (text "Below")
        , row None
            []
            [ el GrayFill [ width (px 200), height (px 100) ] empty
                |> within
                    [ viewWithinOptions ]
            ]
        ]


viewScreen =
    column None
        [ width fill ]
        [ el Small [] (text "**")
        , el PinkFill [ width fill, height (px 100) ] empty
        , screen <|
            viewScreenOptions
        ]


viewWithinOptions =
    column None
        [ spacing 10, width fill ]
        [ el CoralFillA [] (text "A")
        , el CoralFillB [] (text "B")
        , el CoralFillC [] (text "C")
        ]


viewScreenOptions =
    column None
        [ spacing 10, width (percent 5) ]
        [ el CoralFillA [] (text "A")
        , el CoralFillB [] (text "B")
        , el CoralFillC [] (text "C")
        ]


main =
    view
