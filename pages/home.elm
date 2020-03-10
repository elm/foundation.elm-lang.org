module Main exposing (main)


import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Skeleton



-- MAIN


main =
  Browser.document
    { init = \() -> ( (), Cmd.none )
    , view = view
    , update = \_ _ -> ( (), Cmd.none )
    , subscriptions = \_ -> Sub.none
    }



-- VIEW


view : () -> Browser.Document msg
view _ =
  Skeleton.viewBody "Elm Software Foundation" Skeleton.Other
    [ div
        [ style "display" "flex"
        , style "flex-wrap" "wrap"
        , style "flex-direction" "row"
        , style "justify-content" "space-between"
        ]
        [ viewProject "Server Costs"
            [ text "The foundation pays for hosting of Elm websites. You can support sites like "
            , a [ href "https://elm-lang.org/try" ] [ text "elm-lang.org/try" ]
            , text " and "
            , a [ href "https://package.elm-lang.org" ] [ text "package.elm-lang.org" ]
            , text " that help people go from beginner to expert, from writing their first program to publishing packages."
            ]
        , viewProject "Travel Grants"
            [ text "Our grant program helps people attend conferences. The program currently focuses on students, who may not know they can write Elm professionally. We hope to expand the program to more groups as we gain experience."
            ]
        ]
    ]


viewProject : String -> List (Html msg) -> Html msg
viewProject title description =
  div
    [ style "display" "block"
    , style "min-width" "300px"
    , style "max-width" "360px"
    ]
    [ h2 [] [ text title ]
    , p [] description
    ]
