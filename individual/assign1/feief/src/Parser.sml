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

open Obj Parsing;
prim_val vector_ : int -> 'a -> 'a Vector.vector = 2 "make_vect";
prim_val update_ : 'a Vector.vector -> int -> 'a -> unit = 3 "set_vect_item";


open FEIEF;

(* Line 9, file Parser.sml *)
val yytransl = #[
  257 (* AND *),
  258 (* EOF *),
  259 (* EXISTS *),
  260 (* FALSE *),
  261 (* FORALL *),
  262 (* IMPLIES *),
  263 (* IN *),
  264 (* LPAR *),
  265 (* NOT *),
  266 (* OR *),
  267 (* RPAR *),
  268 (* TRUE *),
  269 (* VAR *),
    0];

val yylhs = "\255\255\
\\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\\002\000\002\000\002\000\002\000\000\000";

val yylen = "\002\000\
\\002\000\003\000\003\000\003\000\002\000\004\000\004\000\003\000\
\\001\000\001\000\001\000\001\000\002\000";

val yydefred = "\000\000\
\\000\000\000\000\012\000\000\000\010\000\000\000\000\000\000\000\
\\011\000\009\000\013\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\001\000\000\000\000\000\000\000\000\000\008\000\000\000\
\\000\000\000\000\000\000\000\000";

val yydgoto = "\002\000\
\\011\000\012\000";

val yysindex = "\003\000\
\\014\255\000\000\000\000\248\254\000\000\249\254\014\255\014\255\
\\000\000\000\000\000\000\001\255\002\255\017\255\027\255\052\255\
\\014\255\000\000\014\255\014\255\014\255\014\255\000\000\043\255\
\\043\255\043\255\000\000\000\000";

val yyrindex = "\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\040\255\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\033\255\
\\044\255\046\255\019\255\030\255";

val yygindex = "\000\000\
\\000\000\249\255";

val YYTABLESIZE = 62;
val yytable = "\015\000\
\\016\000\017\000\018\000\001\000\013\000\014\000\019\000\000\000\
\\021\000\024\000\020\000\025\000\026\000\027\000\028\000\003\000\
\\004\000\005\000\006\000\007\000\007\000\007\000\008\000\022\000\
\\007\000\009\000\010\000\017\000\007\000\007\000\006\000\006\000\
\\019\000\003\000\003\000\006\000\020\000\023\000\000\000\006\000\
\\006\000\005\000\003\000\003\000\004\000\004\000\002\000\002\000\
\\019\000\000\000\005\000\000\000\017\000\004\000\004\000\002\000\
\\002\000\019\000\000\000\000\000\000\000\020\000";

val yycheck = "\007\000\
\\008\000\001\001\002\001\001\000\013\001\013\001\006\001\255\255\
\\007\001\017\000\010\001\019\000\020\000\021\000\022\000\002\001\
\\003\001\004\001\005\001\001\001\002\001\008\001\009\001\007\001\
\\006\001\012\001\013\001\001\001\010\001\011\001\001\001\002\001\
\\006\001\001\001\002\001\006\001\010\001\011\001\255\255\010\001\
\\011\001\002\001\010\001\011\001\001\001\002\001\001\001\002\001\
\\006\001\255\255\011\001\255\255\001\001\010\001\011\001\010\001\
\\011\001\006\001\255\255\255\255\255\255\010\001";

val yyact = vector_ 14 (fn () => ((raise Fail "parser") : obj));
(* Rule 1, file Parser.grm, line 29 *)
val _ = update_ yyact 1
(fn () => repr(let
val d__1__ = peekVal 1 : FEIEF.Expr
in
((d__1__)) end : FEIEF.Prog))
;
(* Rule 2, file Parser.grm, line 33 *)
val _ = update_ yyact 2
(fn () => repr(let
val d__1__ = peekVal 2 : FEIEF.Expr
val d__3__ = peekVal 0 : FEIEF.Expr
in
( FEIEF.Or ((d__1__), (d__3__)) ) end : FEIEF.Expr))
;
(* Rule 3, file Parser.grm, line 34 *)
val _ = update_ yyact 3
(fn () => repr(let
val d__1__ = peekVal 2 : FEIEF.Expr
val d__3__ = peekVal 0 : FEIEF.Expr
in
( FEIEF.And ((d__1__), (d__3__)) ) end : FEIEF.Expr))
;
(* Rule 4, file Parser.grm, line 35 *)
val _ = update_ yyact 4
(fn () => repr(let
val d__1__ = peekVal 2 : FEIEF.Expr
val d__3__ = peekVal 0 : FEIEF.Expr
in
( FEIEF.Implies((d__1__), (d__3__)) ) end : FEIEF.Expr))
;
(* Rule 5, file Parser.grm, line 36 *)
val _ = update_ yyact 5
(fn () => repr(let
val d__2__ = peekVal 0 : FEIEF.Expr
in
( FEIEF.Not((d__2__)) ) end : FEIEF.Expr))
;
(* Rule 6, file Parser.grm, line 37 *)
val _ = update_ yyact 6
(fn () => repr(let
val d__2__ = peekVal 2 : string
val d__4__ = peekVal 0 : FEIEF.Expr
in
( FEIEF.Forall((d__2__), (d__4__)) ) end : FEIEF.Expr))
;
(* Rule 7, file Parser.grm, line 38 *)
val _ = update_ yyact 7
(fn () => repr(let
val d__2__ = peekVal 2 : string
val d__4__ = peekVal 0 : FEIEF.Expr
in
( FEIEF.Exists((d__2__), (d__4__)) ) end : FEIEF.Expr))
;
(* Rule 8, file Parser.grm, line 39 *)
val _ = update_ yyact 8
(fn () => repr(let
val d__2__ = peekVal 1 : FEIEF.Expr
in
( (d__2__) ) end : FEIEF.Expr))
;
(* Rule 9, file Parser.grm, line 40 *)
val _ = update_ yyact 9
(fn () => repr(let
val d__1__ = peekVal 0 : string
in
( FEIEF.Var((d__1__)) ) end : FEIEF.Expr))
;
(* Rule 10, file Parser.grm, line 41 *)
val _ = update_ yyact 10
(fn () => repr(let
in
( FEIEF.False ) end : FEIEF.Expr))
;
(* Rule 11, file Parser.grm, line 42 *)
val _ = update_ yyact 11
(fn () => repr(let
in
( FEIEF.True ) end : FEIEF.Expr))
;
(* Entry Prog *)
val _ = update_ yyact 13 (fn () => raise yyexit (peekVal 0));
val yytables : parseTables =
  ( yyact,
    yytransl,
    yylhs,
    yylen,
    yydefred,
    yydgoto,
    yysindex,
    yyrindex,
    yygindex,
    YYTABLESIZE,
    yytable,
    yycheck );
fun Prog lexer lexbuf = yyparse yytables 1 lexer lexbuf;
