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
    | GrayFillDark
    | PinkFill
    | BlueFill
    | GreenFill
    | CoralFillA
    | CoralFillB
    | CoralFillC
    | CoralFillD
    | Title
    | LargeText
    | WhiteP


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
        , Style.style GrayFillDark
            [ Color.background Color.darkCharcoal ]
        , Style.style BlueFill
            [ Color.background Color.blue ]
        , Style.style GreenFill
            [ Color.background (Color.rgba 131 184 110 1) ]
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
        , Style.style WhiteP
            [ Color.text Color.white ]
        , Style.style LargeText
            [ Font.size 45 ]
        ]



-- Element.layout renders the elements as html
-- Every layout requires a stylesheet.


view =
    Element.layout stylesheet <|
        -- An el is the most basic element, like a <div>
        --el Title [ center, width (px 600) ] (text "hello!")
        --column BlueFill [ width fill, alignRight ] [ el BlueFill [] (text "test") ]
        column None
            []
            [ el None [ width (px 1000), center ] <|
                column None
                    []
                    [ viewHeader
                    , row CoralFillD
                        [ padding 30, spacing 30 ]
                        [ column None [ width (percent 50) ] [ viewTextLayout BlueFill ]
                        , column None [ width (percent 50) ] [ viewTextLayout GreenFill ]
                        ]
                    ]

            --viewTextLayout
            ]



--viewBlueParagraph =
--    paragraph []
--        [ el LargeText [ alignLeft, paddingXY 2 1 ] (text "R")
--        , text "abbits were said to have lived in these parts. No one really knows when they first showed up or why...\n  They were said to have descended from \n  another kind of animal called the Ippits, but this may be myth."
--        , text "Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land."
--        ]


viewHeader =
    el Title [] (text "Sandbox 09 - Text")


viewTextLayout varStyle =
    textLayout GrayFill
        [ padding 20, spacing 20 ]
        [ paragraph None
            []
            [ text "Rabbits were said to have lived in these parts. No one really knows when they first showed up or why...\n  They were said to have descended from \n  another kind of animal called the Ippits, but this may be myth."
            , text "Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land."
            ]
        , el GrayFillDark [ width (px 150), height (px 150), alignRight ] empty
        , paragraph None
            []
            [ text "Rabbits were said to have lived in these parts. No one really knows when they first showed up or why...\n  They were said to have descended from \n  another kind of animal called the Ippits, but this may be myth."
            , text "Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land."
            ]
        , paragraph None
            []
            [ text "Rabbits were said to have lived in these parts. No one really knows when they first showed up or why...\n  They were said to have descended from \n  another kind of animal called the Ippits, but this may be myth."
            , text "Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land."
            ]
        , full varStyle
            []
          <|
            paragraph None
                []
                [ text "Rabbits were said to have lived in these parts. No one really knows when they first showed up or why...\n  They were said to have descended from \n  another kind of animal called the Ippits, but this may be myth."
                , text "Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land."
                ]

        --full BlueFill
        --    [ padding 20 ]
        --  <|
        --    paragraph None
        --        []
        --        [ text "Rabbits were said to have lived in these parts. No one really knows when they first showed up or why...\n  They were said to have descended from \n  another kind of animal called the Ippits, but this may be myth."
        --        , text "Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land."
        --        , text "Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land."
        --        , text "Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land. Once, there was a girl bunny who came to the land."
        --        ]
        ]


main =
    view
