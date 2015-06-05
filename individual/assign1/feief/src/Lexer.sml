local open Obj Lexing in



exception Error of string;


fun action_14 lexbuf = (
 raise Error "Unexpected symbol on input." )
and action_13 lexbuf = (
 Parser.EOF )
and action_12 lexbuf = (
 Parser.VAR(getLexeme lexbuf) )
and action_11 lexbuf = (
 Parser.RPAR )
and action_10 lexbuf = (
 Parser.LPAR )
and action_9 lexbuf = (
 Parser.EXISTS )
and action_8 lexbuf = (
 Parser.IN )
and action_7 lexbuf = (
 Parser.FORALL )
and action_6 lexbuf = (
 Parser.NOT )
and action_5 lexbuf = (
 Parser.IMPLIES )
and action_4 lexbuf = (
 Parser.AND )
and action_3 lexbuf = (
 Parser.OR )
and action_2 lexbuf = (
 Parser.TRUE )
and action_1 lexbuf = (
 Parser.FALSE )
and action_0 lexbuf = (
 Token lexbuf )
and state_0 lexbuf = (
 let val currChar = getNextChar lexbuf in
 if currChar >= #"A" andalso currChar <= #"Z" then  state_14 lexbuf
 else if currChar >= #"a" andalso currChar <= #"z" then  state_14 lexbuf
 else case currChar of
    #"\n" => state_3 lexbuf
 |  #"\t" => state_3 lexbuf
 |  #"\r" => state_3 lexbuf
 |  #" " => state_3 lexbuf
 |  #"~" => action_6 lexbuf
 |  #"_" => state_15 lexbuf
 |  #"@" => action_7 lexbuf
 |  #"=" => state_12 lexbuf
 |  #"1" => action_2 lexbuf
 |  #"0" => action_1 lexbuf
 |  #"." => action_8 lexbuf
 |  #"+" => action_3 lexbuf
 |  #"*" => action_4 lexbuf
 |  #")" => action_11 lexbuf
 |  #"(" => action_10 lexbuf
 |  #"#" => action_9 lexbuf
 |  #"\^@" => action_13 lexbuf
 |  _ => action_14 lexbuf
 end)
and state_3 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_0);
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"\n" => state_21 lexbuf
 |  #"\t" => state_21 lexbuf
 |  #"\r" => state_21 lexbuf
 |  #" " => state_21 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_12 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_14);
 let val currChar = getNextChar lexbuf in
 case currChar of
    #">" => action_5 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_14 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_14);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"A" andalso currChar <= #"Z" then  state_19 lexbuf
 else if currChar >= #"a" andalso currChar <= #"z" then  state_19 lexbuf
 else if currChar >= #"0" andalso currChar <= #"9" then  backtrack lexbuf
 else case currChar of
    #"\^@" => backtrack lexbuf
 |  #"_" => backtrack lexbuf
 |  _ => action_12 lexbuf
 end)
and state_15 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_12);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"0" andalso currChar <= #"9" then  state_17 lexbuf
 else if currChar >= #"A" andalso currChar <= #"Z" then  state_17 lexbuf
 else if currChar >= #"a" andalso currChar <= #"z" then  state_17 lexbuf
 else case currChar of
    #"_" => state_17 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_17 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_12);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"0" andalso currChar <= #"9" then  state_17 lexbuf
 else if currChar >= #"A" andalso currChar <= #"Z" then  state_17 lexbuf
 else if currChar >= #"a" andalso currChar <= #"z" then  state_17 lexbuf
 else case currChar of
    #"_" => state_17 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_19 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_12);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"A" andalso currChar <= #"Z" then  state_19 lexbuf
 else if currChar >= #"a" andalso currChar <= #"z" then  state_19 lexbuf
 else if currChar >= #"0" andalso currChar <= #"9" then  backtrack lexbuf
 else case currChar of
    #"\^@" => backtrack lexbuf
 |  #"_" => backtrack lexbuf
 |  _ => action_12 lexbuf
 end)
and state_21 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_0);
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"\n" => state_21 lexbuf
 |  #"\t" => state_21 lexbuf
 |  #"\r" => state_21 lexbuf
 |  #" " => state_21 lexbuf
 |  _ => backtrack lexbuf
 end)
and Token lexbuf =
  (setLexLastAction lexbuf (magic dummyAction);
   setLexStartPos lexbuf (getLexCurrPos lexbuf);
   state_0 lexbuf)

(* The following checks type consistency of actions *)
val _ = fn _ => [action_14, action_13, action_12, action_11, action_10, action_9, action_8, action_7, action_6, action_5, action_4, action_3, action_2, action_1, action_0];

end
