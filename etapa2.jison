%lex

%%
\s+                                         {/* skip whitespace */}
"if"                                        {return 'if'}
"else"                                      {return 'else'}
"switch"                                    {return 'switch'}
"case"                                      {return 'case'}
"default"                                   {return 'default'}
"break"                                     {return 'break'}
^[a-zA-Z_][a-zA-Z0-9_]*                     {return 'IDENTIFIER'}
^[0-9]+                                     {return 'NUMBER'}
"++"                                        {return '++'}
"--"                                        {return '--'}
"+="                                        {return '+='}
"-="                                        {return '-='}
"*="                                        {return '*='}
"/="                                        {return '/='}
"=="                                        {return '=='}
"="                                         {return '='}
"+"                                         {return '+'}
"-"                                         {return '-'}
"*"                                         {return '*'}
"/"                                         {return '/'}
"("                                         {return '('}
")"                                         {return ')'}
"{"                                         {return '{'}
"}"                                         {return '}'}
"!="                                        {return '!='}
"<="                                        {return '<='}
">="                                        {return '>='}
">"                                         {return '>'}
"<"                                         {return '<'}
";"                                         {return ';'}
":"                                         {return ':'}


/lex

%%


START
    : EXPRESSION ";"
    ;

EXPRESSION
    : "if" + "(" + CONDITION + ")" + "{" + COMMAND + "}"
    | "if" + "(" + CONDITION + ")" + "{" + COMMAND + "}" + "else" + "{" + COMMAND + "}"
    | "switch" + "(" + IDENTIFIER + ")" + "{" + CASES + "}"
    | "switch" + "(" + IDENTIFIER + ")" + "{" + CASES + "default" + ":" + "{" + "COMMAND" + "}" + "}"
    ;

CASES
    : "case" + NUMBER ":" + "{" + COMMAND + "break" + ";" + "}"
    | "case" + NUMBER ":" + "{" + COMMAND + "break" + ";" + "}" CASES
    ;

CONDITION
    : VALUE_TYPE REL_OPERATOR VALUE_TYPE
    ;

VALUE_TYPE
    : NUMBER 
    | IDENTIFIER
    ;

REL_OPERATOR
    : "=="
    | "!="
    | "<="
    | ">="
    | "<"
    | ">"
    ;

MATH_OP
    : "+"
    | "-"
    | "*"
    | "/"
    ;

INC_DEC
    : "++"
    | "--"
    ;

ATRIB_OP
    : "="
    | "+="
    | "-="
    | "*="
    | "/="
    ;


COMMAND
    : IDENTIFIER ATRIB_OP VALUE_TYPE ";"
    | IDENTIFIER INC_DEC ";"
    | IDENTIFIER ATRIB_OP VALUE_TYPE MATH_OP VALUE_TYPE ";"

    | IDENTIFIER ATRIB_OP VALUE_TYPE ";" COMMAND
    | IDENTIFIER INC_DEC ";" COMMAND
    | IDENTIFIER ATRIB_OP VALUE_TYPE MATH_OP VALUE_TYPE ";" COMMAND
    ;

