---- Script Info ----
script_name = 'RLO'
script_description = 'Reverses the order of the selected lines.'
script_author = 'OHIOXOIHO'
script_version = '1.1'



function reverseSelectedLines(subs, selected_lines)

    if #selected_lines == 0 then
        aegisub.debug.out("No lines selected.")
        return
    end

    local totalLines = #subs

    for i = 1, math.floor(#selected_lines / 2) do
        local index1 = selected_lines[i]
        local index2 = selected_lines[#selected_lines - i + 1]

        local temp = subs[index1]
        subs[index1] = subs[index2]
        subs[index2] = temp
    end

    aegisub.set_undo_point("Reverse Selected Lines Arrangement")
end

aegisub.register_macro("Reverse Selected Lines Order", "Reverse the arrangement of selected lines", reverseSelectedLines)
