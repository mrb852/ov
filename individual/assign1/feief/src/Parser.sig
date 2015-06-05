local
in
datatype token =
    AND
  | EOF
  | EXISTS
  | FALSE
  | FORALL
  | IMPLIES
  | IN
  | LPAR
  | NOT
  | OR
  | RPAR
  | TRUE
  | VAR of string
end;

val Prog :
  (Lexing.lexbuf -> token) -> Lexing.lexbuf -> FEIEF.Prog;
