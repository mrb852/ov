{

exception Error of string;

}

rule Token = parse
  [` ` `\t` `\r` `\n`]+ { Token lexbuf }
  |  `0`   { Parser.FALSE }
  | `1`   { Parser.TRUE }
  | `+`   { Parser.OR }
  | `*`   { Parser.AND }
  | "=>"  { Parser.IMPLIES }
  | `~`   { Parser.NOT }
  | `@`   { Parser.FORALL }
  | `.`   { Parser.IN }
  | `#`   { Parser.EXISTS }
  | `(`   { Parser.LPAR }
  | `)`   { Parser.RPAR }
  | [`a`-`z` `A`-`Z`]+[^`_` `0`-`9`]|`_`[`A`-`Z` `a`-`z` `0`-`9` `_`]*   { Parser.VAR(getLexeme lexbuf) }
  | eof   { Parser.EOF }
  | _     { raise Error "Unexpected symbol on input." }
;
