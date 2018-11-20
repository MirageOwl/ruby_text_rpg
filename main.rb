require 'rutui'

screen = RuTui::Screen.new
text = RuTui::Text.new( x: 3, y: 3, text: "Hello world!", foreground: 11 )
screen.add text
screen.draw
a = RuTui::Input.getc
print RuTui::Ansi.clear_color + RuTui::Ansi.clear
