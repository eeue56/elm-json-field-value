module Json.Decode.FieldValue exposing (..)

{-| Decode helpers for a field.

@docs fieldValue

-}

import Json.Decode


{-| Successfully decodes a value when the decoded string matches the given item

    fieldValue "yes" <| Json.Encode.string "yes"
    --> Json.Decode.succeed "yes"

    fieldValue "no" <| Json.Encode.string "yes"
    --> Json.Decode.fail "Expected 'no' but got 'yes'"

This is intended for when you need to match against a specific value for a field.

For example:

    { "type": "Dog" }

    Json.Decode.field "type" (fieldValue "Dog")

-}
fieldValue : String -> Json.Decode.Decoder String
fieldValue passingFieldValue =
    Json.Decode.string
        |> Json.Decode.andThen
            (\value ->
                if value == passingFieldValue then
                    Json.Decode.succeed value
                else
                    "Expected '"
                        ++ passingFieldValue
                        ++ "' but got '"
                        ++ value
                        ++ "'"
                        |> Json.Decode.fail
            )
