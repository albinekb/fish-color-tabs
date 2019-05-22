function tab_color -d "Set tab color"
    echo -ne "\033]6;1;bg;red;brightness;$argv[1]\a"
    echo -ne "\033]6;1;bg;green;brightness;$argv[2]\a"
    echo -ne "\033]6;1;bg;blue;brightness;$argv[3]\a"
end

function reset_tab_color -d "Reset tab color"
    echo -ne "\033]6;1;bg;*;default\a"
end

function color_tabs --on-variable PWD
  if string match '*/pwa-*' $PWD >> /dev/null
    tab_color 104 250 56
  else if string match '*/frontend-*' $PWD >> /dev/null
    tab_color 104 159 56
  else if string match '*/service-*' $PWD >> /dev/null
    tab_color 249 168 37
  else if string match '*/app-*' $PWD >> /dev/null
    tab_color 104 159 56
  else if string match '*/kap*' $PWD >> /dev/null
    tab_color 45 28 100
  else
    reset_tab_color
  end
end

color_tabs
