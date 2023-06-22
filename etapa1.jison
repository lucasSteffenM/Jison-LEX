%lex

%%
\s+                                         {/* skip whitespace */}
^(int|float)+                               {return 'TYPE'}
","                                         {return ','}
";"                                         {return ';'}
"["                                         {return '['}
"]"                                         {return ']'}
"char"                                      {return 'char'}
^[a-zA-Z_][a-zA-Z0-9_]*                     {return 'IDENTIFIER'}
^[0-9]+                                     {return 'NUMBER'}

/lex

%%


START
    : EXPRESSION ";"
    ;

EXPRESSION
    : TYPE + IDENTIFIER_LIST
    | "char" CHAR_LIST
    ;

IDENTIFIER_LIST
    : IDENTIFIER_LIST "," IDENTIFIER
    | IDENTIFIER
    ;

CHAR_LIST
    :  CHAR_LIST "," IDENTIFIER ARRAY
    |  IDENTIFIER ARRAY
    |  IDENTIFIER
    ;

ARRAY
    : "[" + NUMBER + "]"
    | ""
    ;