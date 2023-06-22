%lex

%%
\s+                                         {/* skip whitespace */}
^(int|float|char)+                          {return 'TYPE'}
","                                         {return ','}
";"                                         {return ';'}
"["                                         {return '['}
"]"                                         {return ']'}
^[a-zA-Z_][a-zA-Z0-9_]*                     {return 'IDENTIFIER'}
^[0-9]+                                     {return 'NUMBER'}

/lex

%%


START
    : EXPRESSION ";"
    ;

EXPRESSION
    : TYPE + IDENTIFIER_LIST
    ;

IDENTIFIER_LIST
    : IDENTIFIER "," IDENTIFIER_LIST
    | IDENTIFIER ARRAY "," IDENTIFIER_LIST
    | IDENTIFIER ARRAY
    | IDENTIFIER
    ;

ARRAY
    : "[" NUMBER "]"
    ;