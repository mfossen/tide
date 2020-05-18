function fake_lean_right_prompt
    set -l splitText (string split '\n' (_fetch_right_prompt_items))
    set -l printAtEndedRightPromptHeight (count $splitText)

    for thing in $splitText
        _print_at_end $thing
    end

    _cursor_up $printAtEndedRightPromptHeight
end

function _fetch_right_prompt_items
    printf '%s' ' '

    for item in fake_lean_{$fake_lean_right_prompt_items}
        set -l itemOutput (_$item)
        printf '%s' "$itemOutput"

        set_color normal
    end
end

function _print_at_end -a text
    set -l startLocation (math $fake_columns -(string length (lean_decolor $text)))
    _cursor_right $startLocation
    printf '%s' $text

    printf '%b' '\v'
    printf '%b' '\r'
end