#!/usr/bin/env sh
curl \
--data-urlencode Lexer.lex@Lexer.lex \
--data-urlencode Parser.grm@Parser.grm \
--data-urlencode secret=hamster \
http://onlineta.org
